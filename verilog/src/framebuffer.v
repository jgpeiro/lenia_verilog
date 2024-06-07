module framebuffer(
    input wire clk,
    input wire resetn,
    input wire wr_enable,
    input wire rd_enable,
    input wire [22:0] addr,
    input wire [31:0] wr_data,
    output reg [31:0] rd_data,
    output reg busy,
    inout [31:0] IO_sdram_dq,
    output [10:0] O_sdram_addr,
    output [1:0] O_sdram_ba,
    output O_sdram_cs_n,
    output O_sdram_ras_n,
    output O_sdram_cas_n,
    output O_sdram_wen_n,
    output O_sdram_clk,
    output O_sdram_cke,
    output [3:0] O_sdram_dqm
);
    // Instantiate SDRAM controller and manage read/write operations
    sdram u_sdram (
        .clk(clk),
        .clk_sdram(clk),  // Assuming no phase shift required
        .resetn(resetn),
        .addr(addr),
        .rd(rd_enable),
        .wr(wr_enable),
        .din(wr_data),
        .dout(rd_data),
        .data_ready(data_ready),
        .busy(busy),

        .SDRAM_DQ(IO_sdram_dq),
        .SDRAM_A(O_sdram_addr),
        .SDRAM_BA(O_sdram_ba),
        .SDRAM_nCS(O_sdram_cs_n),
        .SDRAM_nWE(O_sdram_wen_n),
        .SDRAM_nRAS(O_sdram_ras_n),
        .SDRAM_nCAS(O_sdram_cas_n),
        .SDRAM_CLK(O_sdram_clk),
        .SDRAM_CKE(O_sdram_cke),
        .SDRAM_DQM(O_sdram_dqm)
    );
endmodule

module drawing_engine(
    input wire clk,
    input wire resetn,
    input wire start_draw,
    output reg [22:0] addr,
    output reg [31:0] wr_data,
    output reg wr_enable,
    output reg draw_complete
);
    // Parameters
    parameter FRAME_WIDTH = 480;
    parameter FRAME_HEIGHT = 272;
    parameter SQUARE_SIZE = 20;
    
    reg [8:0] square_x;
    reg [8:0] square_y;
    reg [4:0] state;

    localparam IDLE = 0;
    localparam CLEAR = 1;
    localparam DRAW = 2;
    localparam COMPLETE = 3;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= IDLE;
            addr <= 0;
            wr_data <= 0;
            wr_enable <= 0;
            draw_complete <= 0;
            square_x <= 0;
            square_y <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start_draw) begin
                        addr <= 0;
                        wr_data <= 0;
                        wr_enable <= 1;
                        state <= CLEAR;
                    end
                end
                CLEAR: begin
                    if (addr < FRAME_WIDTH * FRAME_HEIGHT) begin
                        addr <= addr + 1;
                        wr_data <= 32'b0;  // Clear with black color
                    end else begin
                        addr <= 0;
                        wr_enable <= 0;
                        state <= DRAW;
                    end
                end
                DRAW: begin
                    if (square_x < SQUARE_SIZE && square_y < SQUARE_SIZE) begin
                        wr_enable <= 1;
                        wr_data <= 32'hFFFF0000;  // Red color for the square
                        addr <= (square_y + addr / FRAME_WIDTH) * FRAME_WIDTH + square_x + addr % FRAME_WIDTH;
                        square_x <= square_x + 1;
                    end else if (square_y < SQUARE_SIZE) begin
                        square_x <= 0;
                        square_y <= square_y + 1;
                    end else begin
                        wr_enable <= 0;
                        draw_complete <= 1;
                        state <= COMPLETE;
                    end
                end
                COMPLETE: begin
                    if (!start_draw) begin
                        draw_complete <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule

