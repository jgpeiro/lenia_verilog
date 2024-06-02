module FramebufferController (
    input wire i_clk,
    input wire i_rst,
    input wire i_swap_request,
    output reg [22:0] o_fb_read_addr,
    output reg [22:0] o_fb_write_addr
);

    reg current_fb;

    localparam FRAMEBUFFER_SIZE = 480 * 272 * 4;  // Each canvas is 480x272 and 32 bits (4 bytes) per pixel

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            current_fb <= 0;
            o_fb_read_addr <= 0;
            o_fb_write_addr <= FRAMEBUFFER_SIZE;
        end else if (i_swap_request) begin
            current_fb <= ~current_fb;
            if (current_fb) begin
                o_fb_read_addr <= FRAMEBUFFER_SIZE;
                o_fb_write_addr <= 0;
            end else begin
                o_fb_read_addr <= 0;
                o_fb_write_addr <= FRAMEBUFFER_SIZE;
            end
        end
    end

endmodule


module DrawingEngine (
    input wire i_clk,
    input wire i_rst,
    input wire i_start_draw,
    output reg o_draw_done,
    output reg [22:0] o_addr,
    output reg [31:0] o_data,
    output reg o_wr
);

    reg [8:0] square_x;
    reg [7:0] square_y;
    reg [1:0] state;
    localparam IDLE = 2'b00;
    localparam CLEAR = 2'b01;
    localparam DRAW_SQUARE = 2'b10;

    localparam SCREEN_WIDTH = 480;
    localparam SCREEN_HEIGHT = 272;
    localparam SQUARE_SIZE = 50;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            square_x <= 0;
            square_y <= 0;
            state <= IDLE;
            o_draw_done <= 0;
            o_wr <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (i_start_draw) begin
                        state <= CLEAR;
                        o_addr <= 0;
                        o_data <= 32'h00000000;  // Clear color
                        o_wr <= 1;
                    end
                end

                CLEAR: begin
                    if (o_addr < SCREEN_WIDTH * SCREEN_HEIGHT - 1) begin
                        o_addr <= o_addr + 1;
                        o_wr <= 1;
                    end else begin
                        o_addr <= square_y * SCREEN_WIDTH + square_x;
                        o_data <= 32'hFFFFFFFF;  // Draw color
                        state <= DRAW_SQUARE;
                    end
                end

                DRAW_SQUARE: begin
                    if (square_y < SQUARE_SIZE && square_x < SQUARE_SIZE) begin
                        o_addr <= o_addr + 1;
                        if (square_x < SQUARE_SIZE - 1) begin
                            square_x <= square_x + 1;
                        end else begin
                            square_x <= 0;
                            square_y <= square_y + 1;
                            o_addr <= (square_y + 1) * SCREEN_WIDTH;
                        end
                        o_wr <= 1;
                    end else begin
                        o_draw_done <= 1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule


module top (
    input sys_clk,
    input reset,  // Reset signal
    input s1,  // btn signal
    output O_sdram_clk,
    output O_sdram_cke,
    output O_sdram_cs_n,
    output O_sdram_cas_n,
    output O_sdram_ras_n,
    output O_sdram_wen_n,
    inout [31:0] IO_sdram_dq,
    output [10:0] O_sdram_addr,
    output [1:0] O_sdram_ba,
    output [3:0] O_sdram_dqm,

    output [5:0] led,

    output LCD_CLK,
    output LCD_VSYNC,
    output LCD_HSYNC,
    output LCD_DE,
    output LCD_BL,
    output [4:0] LCD_R,
    output [5:0] LCD_G,
    output [4:0] LCD_B
);
    // Define clock signals
    wire clk;
    wire clk_sdram;

    // Reset signal synchronized with system clock
    wire sys_resetn = ~reset;

    // Signals for framebuffer controller
    wire [22:0] fb_read_addr;
    wire [22:0] fb_write_addr;
    wire swap_request;

    // Signals for drawing engine
    wire draw_done;
    wire [22:0] draw_addr;
    wire [31:0] draw_data;
    wire draw_wr;

    // Flag to start drawing
    reg start_draw;
    
    ref [3:0] state;
    parameter STATE_IDLE = 0;
    parameter STATE_CLEAR = 1;
    parameter STATE_DRAW = 2;
    parameter STATE_SHOW = 3;
    
    
    
    // Generate start signal for drawing engine upon pressing s1
    always @(negedge s1 or posedge reset) begin
        if (reset) begin
            start_draw <= 0;
        end else begin
            
        end
    end
    
    // Instantiate Drawing Engine module
    DrawingEngine draw_eng (
        .i_clk(clk),
        .i_rst(reset),
        .i_start_draw(start_draw),
        .o_draw_done(draw_done),
        .o_addr(draw_addr),
        .o_data(draw_data),
        .o_wr(draw_wr)
    );

    // Generate clocks for SDRAM
    Gowin_rPLL pll(
        .clkout(clk),
        .clkoutp(clk_sdram),
        .clkin(sys_clk)
    );

    // Instantiate SDRAM Controller module
    sdram u_sdram (
        .clk(clk),
        .clk_sdram(clk_sdram),
        .resetn(sys_resetn),
        .addr(draw_wr ? draw_addr + fb_write_addr : fb_read_addr),
        .rd(~draw_wr),
        .wr(draw_wr),
        .refresh(0),
        .din(draw_data),
        .dout(),
        .data_ready(),
        .busy(),

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

    // Instantiate VGA Controller module
    wire [15:0] x;
    wire [15:0] y;
    Vga vga0 (
        .i_rst(reset),
        .i_clk(clk),
        .o_dclk(LCD_CLK),
        .o_hsync(LCD_HSYNC),
        .o_vsync(LCD_VSYNC),
        .o_de(LCD_DE),
        .o_bl(LCD_BL),
        .o_x(x),
        .o_y(y)
    );

    // Assign colors to LCD output based on read framebuffer address
    assign LCD_R = {5{fb_read_addr[y*SCREEN_HEIGHT + x]}};
    assign LCD_G = {6{fb_read_addr[y*SCREEN_HEIGHT + x]}};
    assign LCD_B = {5{fb_read_addr[y*SCREEN_HEIGHT + x]}};

    // LED output
    assign led = 6'b0;  // No specific LED behavior defined

endmodule
