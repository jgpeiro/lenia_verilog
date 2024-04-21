// Example for using the NESTang SDRAM controller on Tang Nano 20K

`timescale 1ps /1ps

module top
  (
    input sys_clk,
    input s1,

    // "Magic" port names that the gowin compiler connects to the on-chip SDRAM
    output O_sdram_clk,
    output O_sdram_cke,
    output O_sdram_cs_n,            // chip select
    output O_sdram_cas_n,           // columns address select
    output O_sdram_ras_n,           // row address select
    output O_sdram_wen_n,           // write enable
    inout [31:0] IO_sdram_dq,       // 32 bit bidirectional data bus
    output [10:0] O_sdram_addr,     // 11 bit multiplexed address bus
    output [1:0] O_sdram_ba,        // two banks
    output [3:0] O_sdram_dqm,       // 32/4

    output [5:0] led

    //output uart_txp
  );

reg sys_resetn = 0;
reg start;      // press s1 to start the system
always @(posedge clk) begin
    if (s1) begin
        start <= 1;
        sys_resetn <= 1;
    end
end
wire debug_clock = sys_clk;

reg rd = 0, wr = 0, refresh = 0;
reg [22:0] addr;
reg [31:0] din;
wire [31:0] dout;

localparam FREQ=27_000_000;

Gowin_rPLL pll(
    .clkout(clk),           // Main clock
    .clkoutp(clk_sdram),    // Phase shifted clock for SDRAM
    .clkin(sys_clk)         // 27Mhz system clock
);

sdram #(.FREQ(FREQ)) u_sdram (
    .clk(clk),
    .clk_sdram(clk_sdram),
    .resetn(sys_resetn && start),
    .addr(addr),
    .rd(rd),
    .wr(wr),
    .refresh(refresh),
    .din(din),
    .dout(dout),
    .data_ready(data_ready),
    .busy(busy),

    .SDRAM_DQ(IO_sdram_dq),     // 32 bit bidirectional data bus
    .SDRAM_A(O_sdram_addr),     // 11 bit multiplexed address bus
    .SDRAM_BA(O_sdram_ba),      // 4 banks
    .SDRAM_nCS(O_sdram_cs_n),   // a single chip select
    .SDRAM_nWE(O_sdram_wen_n),  // write enable
    .SDRAM_nRAS(O_sdram_ras_n), // row address select
    .SDRAM_nCAS(O_sdram_cas_n), // columns address select
    .SDRAM_CLK(O_sdram_clk),
    .SDRAM_CKE(O_sdram_cke),
    .SDRAM_DQM(O_sdram_dqm)
);

    localparam [3:0] WRA = 3'd0;
    localparam [3:0] WRB = 3'd1;
    localparam [3:0] WRC = 3'd2;
    localparam [3:0] RDA = 3'd3;
    localparam [3:0] RDB = 3'd4;
    localparam [3:0] RDC = 3'd5;
    localparam [31:0] MEM_SIZE = 1024*1024*8;
    localparam REFRESH_COUNT = 2*FREQ/1000/1000*15;     // 15us refresh

    reg [3:0] state;
    reg [7:0] leds;
    assign led = leds[5:0];

    localparam [3:0] STATE_REFRESH_IDLE = 3'd0;
    localparam [3:0] STATE_WAIT_BUSY_0  = 3'd1;
    localparam [3:0] STATE_WAIT_BUSY_1  = 3'd2;
    localparam [3:0] STATE_WAIT_BUSY_2  = 3'd3;
    reg [3:0] state_refresh = 0;
    reg [15:0] refresh_cnt;
    always @( posedge clk or negedge sys_resetn ) begin
        if( !sys_resetn ) begin
            state_refresh <= STATE_REFRESH_IDLE;
            refresh_cnt <= 0;
        end else begin
            case( state_refresh )
                STATE_REFRESH_IDLE: begin
                    if( refresh_cnt + 1'b1 < REFRESH_COUNT ) begin
                        refresh_cnt <= refresh_cnt + 1'b1;
                    end else begin
                        refresh_cnt <= 0;
                        state_refresh <= STATE_WAIT_BUSY_0;
                    end
                end
                STATE_WAIT_BUSY_0: begin
                    if( !busy ) begin
                        refresh <= 1;
                        state_refresh <= STATE_WAIT_BUSY_1;
                    end
                end
                STATE_WAIT_BUSY_1: begin
                    if( busy ) begin
                        refresh <= 0;
                        state_refresh <= STATE_WAIT_BUSY_2;
                    end
                end
                STATE_WAIT_BUSY_2: begin
                    if( !busy ) begin
                        state_refresh <= STATE_REFRESH_IDLE;
                    end
                end
            endcase
        end
    end

    always @( posedge clk or negedge sys_resetn ) begin
        if( !sys_resetn ) begin
            addr <= 0;
            din <= 0;
            state <= WRA;
        end else begin
            if( state_refresh == STATE_REFRESH_IDLE ) begin
                case( state )
                    WRA: begin
                        din <= {addr[15:0],addr[15:0]};
                        wr <= 1;
                        state <= WRB;
                    end
                    WRB: begin
                        if( busy ) begin
                            wr <= 0;
                            state <= WRC;
                        end
                    end
                    WRC: begin
                        if( !busy ) begin
                            if( addr < MEM_SIZE-1 ) begin
                                addr <= addr + 1'b1;
                                state <= WRA;
                            end else begin
                                addr <= 0;
                                state <= RDA;
                            end
                        end
                    end
                    
                    RDA: begin
                        rd <= 1;
                        state <= RDB;
                    end
                    RDB: begin
                        if( busy ) begin
                            rd <= 0;
                            state <= RDC;
                        end
                    end
                    RDC: begin
                        if( !busy ) begin
                            leds <= dout;
                            if( addr < MEM_SIZE-1 ) begin
                                addr <= addr + 1'b1;
                                state <= RDA;
                            end else begin
                                addr <= 0;
                                state <= WRA;
                            end
                        end
                    end
                endcase
            end
        end
    end

endmodule


