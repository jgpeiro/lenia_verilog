/**
 * @file sdram.v
 * @brief Simple SDRAM controller for Tang 20k
 * @author nand2mario
 * @version 1.1
 * @date 2023-07
 *
 * @details
 * This module is a 32 bit based, low-latency, and non-bursting controller for the embedded SDRAM
 * on Tang Nano 20K. The SDRAM module is 64Mbit 32bit (2K rows x 256 columns x 4 banks x 32 bits).
 *
 * Features:
 * - Data read latency is 4 cycles
 * - Read/write operations take 5 cycles to complete with no overlap
 * - All reads/writes are done with auto-precharge
 * - Periodic refreshes are required to prevent data loss
 *
 * Requirements:
 * - A 180-degree phase-shifted clock signal (clk_sdram) is needed for SDRAM
 * - Auto-refresh should be invoked at least once every ~15us to prevent data loss
 */
 
module sdram
#(
    parameter         FREQ = 64_800_000,
    parameter         DATA_WIDTH = 32,
    parameter         ROW_WIDTH = 11,
    parameter         COL_WIDTH = 8,
    parameter         BANK_WIDTH = 2,
    parameter [3:0]   CAS  = 4'd2,
    parameter [3:0]   T_WR = 4'd2,
    parameter [3:0]   T_MRD= 4'd2,
    parameter [3:0]   T_RP = 4'd1,
    parameter [3:0]   T_RCD= 4'd1,
    parameter [3:0]   T_RC = 4'd4
)
(
    inout      [DATA_WIDTH-1:0] SDRAM_DQ,
    output reg [ROW_WIDTH-1 :0] SDRAM_A,
    output reg [BANK_WIDTH-1:0] SDRAM_BA,
    output            SDRAM_nCS,
    output reg        SDRAM_nWE,
    output reg        SDRAM_nRAS,
    output reg        SDRAM_nCAS,
    output            SDRAM_CLK,
    output            SDRAM_CKE,
    output reg  [3:0] SDRAM_DQM,
    
    input             clk,
    input             clk_sdram,
    input             resetn,
    input             rd,
    input             wr,
    input             refresh,
    input      [22:0] addr,
    input      [DATA_WIDTH-1:0] din,
    output     [DATA_WIDTH-1:0] dout,
    output reg        data_ready,
    output reg        busy
);

assign SDRAM_DQ = dq_oen ? 32'bzzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz : dq_out;
wire [DATA_WIDTH-1:0] dq_in = SDRAM_DQ;
reg [31:0] dout_buf;
assign dout = data_ready ? dq_in : dout_buf;
assign SDRAM_CLK = clk_sdram;
assign SDRAM_CKE = 1'b1;
assign SDRAM_nCS = 1'b0;

reg [2:0] state;
localparam INIT = 3'd0;
localparam CONFIG = 3'd1;
localparam IDLE = 3'd2;
localparam READ = 3'd3;
localparam WRITE = 3'd4;
localparam REFRESH = 3'd5;

localparam CMD_SetModeReg=3'b000;
localparam CMD_AutoRefresh=3'b001;
localparam CMD_PreCharge=3'b010;
localparam CMD_BankActivate=3'b011;
localparam CMD_Write=3'b100;
localparam CMD_Read=3'b101;
localparam CMD_NOP=3'b111;

localparam [2:0] BURST_LEN = 3'b0;
localparam BURST_MODE = 1'b0;
localparam [10:0] MODE_REG = {4'b0, CAS[2:0], BURST_MODE, BURST_LEN};

reg cfg_now;
reg [3:0] cycle;
reg [31:0] din_buf;
reg [22:0] addr_buf;
reg dq_oen;
reg [DATA_WIDTH-1:0] dq_out;

always @(posedge clk) begin
    cycle <= cycle == 4'd15 ? 4'd15 : cycle + 4'd1;
    {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_NOP; 
    casex ({state, cycle})
        {INIT, 4'bxxxx} : if (cfg_now) begin
            state <= CONFIG;
            cycle <= 0;
        end
        {CONFIG, 4'd0} : begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_PreCharge;
            SDRAM_A[10] <= 1'b1;
        end
        {CONFIG, T_RP} : begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_AutoRefresh;
        end
        {CONFIG, T_RP+T_RC} : begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_AutoRefresh;
        end
        {CONFIG, T_RP+T_RC+T_RC} : begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_SetModeReg;
            SDRAM_A[10:0] <= MODE_REG;
        end
        {CONFIG, T_RP+T_RC+T_RC+T_MRD} : begin
            state <= IDLE;
            busy <= 1'b0;
        end
        {IDLE, 4'bxxxx}: if (rd | wr) begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_BankActivate;
            SDRAM_BA <= addr[ROW_WIDTH+COL_WIDTH+BANK_WIDTH-1 : ROW_WIDTH+COL_WIDTH];
            SDRAM_A <= addr[ROW_WIDTH+COL_WIDTH-1:COL_WIDTH];
            state <= rd ? READ : WRITE;
            addr_buf <= addr;
            if (wr) din_buf <= din;
            cycle <= 4'd1;
            busy <= 1'b1;
        end else if (refresh) begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_AutoRefresh;
            state <= REFRESH;
            cycle <= 4'd1;
            busy <= 1'b1;
        end
        {READ, T_RCD}: begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_Read;
            SDRAM_A[10] <= 1'b1;
            SDRAM_A[9:0] <= addr_buf[COL_WIDTH-1:0];
            SDRAM_DQM <= 4'b0;
        end
        {READ, T_RCD+CAS}: begin
            data_ready <= 1'b1;
        end
        {READ, T_RCD+CAS+4'd1}: begin
            data_ready <= 1'b0;
            dout_buf <= dq_in;
            busy <= 0;
            state <= IDLE;
        end
        {WRITE, T_RCD}: begin
            {SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE} <= CMD_Write;
            SDRAM_A[10] <= 1'b1;
            SDRAM_A[9:0] <= addr_buf[COL_WIDTH-1:0];
            SDRAM_DQM <= 4'b0;
            dq_out <= din_buf;
            dq_oen <= 1'b0;
        end
        {WRITE, T_RCD+4'd1}: begin
            dq_oen <= 1'b1;
        end
        {WRITE, T_RCD+T_WR+T_RP}: begin
            busy <= 0;
            state <= IDLE;
        end
        {REFRESH, T_RC}: begin
            state <= IDLE;
            busy <= 0;
        end
    endcase
    if (~resetn) begin
        busy <= 1'b1;
        dq_oen <= 1'b1;
        SDRAM_DQM <= 4'b0;
        state <= INIT;
    end
end

reg  [14:0]   rst_cnt;
reg rst_done, rst_done_p1, cfg_busy;
  
always @(posedge clk) begin
    rst_done_p1 <= rst_done;
    cfg_now     <= rst_done & ~rst_done_p1;
    if (rst_cnt != FREQ / 1000 * 200 / 1000) begin
        rst_cnt  <= rst_cnt[14:0] + 1'b1;
        rst_done <= 1'b0;
        cfg_busy <= 1'b1;
    end else begin
        rst_done <= 1'b1;
        cfg_busy <= 1'b0;
    end
    if (~resetn) begin
        rst_cnt  <= 15'd0;
        rst_done <= 1'b0;
        cfg_busy <= 1'b1;
    end
end

endmodule