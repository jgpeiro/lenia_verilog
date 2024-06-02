`timescale 1ns / 1ps

module axi4_systolic_array #(
    parameter SIZE = 32
)(
    input wire clk,
    input wire resetn,
    // AXI4-Lite slave interface
    input wire [31:0] s_axi_awaddr,
    input wire s_axi_awvalid,
    output reg s_axi_awready,
    input wire [31:0] s_axi_wdata,
    input wire [3:0] s_axi_wstrb,
    input wire s_axi_wvalid,
    output reg s_axi_wready,
    output reg [1:0] s_axi_bresp,
    output reg s_axi_bvalid,
    input wire s_axi_bready,
    input wire [31:0] s_axi_araddr,
    input wire s_axi_arvalid,
    output reg s_axi_arready,
    output reg [31:0] s_axi_rdata,
    output reg [1:0] s_axi_rresp,
    output reg s_axi_rvalid,
    input wire s_axi_rready,
    // Convolution control
    output reg done,
    // Memory interfaces for kernel and world
    input wire [31:0] kernel_data,
    output reg kernel_read,
    input wire [31:0] world_data,
    output reg world_read
);

// AXI4-Lite slave interface implementation

// Address decoding
localparam ADDR_KERNEL_BASE = 32'h0000_0000;
localparam ADDR_WORLD_BASE  = 32'h0000_1000;
localparam ADDR_CONTROL     = 32'h0000_2000;
localparam ADDR_RESULT_BASE = 32'h0000_3000;

// AXI4-Lite slave interface state machine
localparam IDLE = 2'b00;
localparam WRITE = 2'b01;
localparam READ = 2'b10;

reg [1:0] state;
reg [31:0] awaddr_reg, araddr_reg;
reg [31:0] wdata_reg;
reg [3:0] wstrb_reg;
reg [7:0] kernel_index;
reg [7:0] world_index;

// Systolic array for convolution
reg [31:0] kernel [0:SIZE-1][0:SIZE-1];
reg [31:0] world [0:SIZE-1][0:SIZE-1];
reg [31:0] result [0:SIZE-1][0:SIZE-1];
reg [31:0] tmp;

integer i, j, k, l;

// Load kernel and world data
always @(posedge clk) begin
    if (!resetn) begin
        // Reset
        kernel_read <= 0;
        world_read <= 0;
        kernel_index <= 0;
        world_index <= 0;
        i <= 0;
        j <= 0;
        k <= 0;
        l <= 0;
    end else begin
        if (kernel_read) begin
            kernel[kernel_index / SIZE][kernel_index % SIZE] <= kernel_data;
            kernel_index <= kernel_index + 1;
        end

        if (world_read) begin
            world[world_index / SIZE][world_index % SIZE] <= world_data;
            world_index <= world_index + 1;
        end
    end
end
integer x, y;
// Convolution operation
always @(posedge clk) begin
    if (!resetn) begin
        // Reset
        done <= 0;
        x <= 0;
        y <= 0;
        tmp <= 0;
    end else if (state == IDLE && s_axi_wvalid && s_axi_wready) begin
        // Perform convolution
        for (i = 0; i < SIZE; i = i + 1) begin
            for (j = 0; j < SIZE; j = j + 1) begin
                result[i][j] <= 0;
                for (k = 0; k < SIZE; k = k + 1) begin
                    for (l = 0; l < SIZE; l = l + 1) begin
                        x = i + k - SIZE / 2;
                        y = j + l - SIZE / 2;
                        if (0 <= x && x < SIZE && 0 <= y && y < SIZE) begin
                            result[i][j] <= result[i][j] + kernel[k][l] * world[x][y];
                            tmp <= result[i][j]+i;
                        end
                    end
                end
            end
        end
        done <= 1;
    end else begin
        done <= 0;
    end
end

integer index;
// AXI4-Lite slave interface logic
always @(posedge clk) begin
    if (!resetn) begin
        state <= IDLE;
        s_axi_awready <= 1'b0;
        s_axi_wready <= 1'b0;
        s_axi_bvalid <= 1'b0;
        s_axi_bresp <= 2'b00;
        s_axi_arready <= 1'b0;
        s_axi_rvalid <= 1'b0;
        s_axi_rresp <= 2'b00;
        awaddr_reg <= 32'b0;
        araddr_reg <= 32'b0;
        wdata_reg <= 32'b0;
        wstrb_reg <= 4'b0;
        index <= 0;
        s_axi_rdata <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (s_axi_awvalid && !s_axi_awready) begin
                    s_axi_awready <= 1'b1;
                    awaddr_reg <= s_axi_awaddr;
                    state <= WRITE;
                end else if (s_axi_arvalid && !s_axi_arready) begin
                    s_axi_arready <= 1'b1;
                    araddr_reg <= s_axi_araddr;
                    state <= READ;
                end
            end

            WRITE: begin
                s_axi_awready <= 1'b0;
                if (s_axi_wvalid && !s_axi_wready) begin
                    s_axi_wready <= 1'b1;
                    wdata_reg <= s_axi_wdata;
                    wstrb_reg <= s_axi_wstrb;
                end
                if (s_axi_wready && s_axi_wvalid) begin
                    s_axi_wready <= 1'b0;
                    s_axi_bvalid <= 1'b1;
                    s_axi_bresp <= 2'b00; // OKAY response
                    // Write data to the appropriate memory
                    if (awaddr_reg >= ADDR_KERNEL_BASE && awaddr_reg < ADDR_KERNEL_BASE + SIZE*SIZE*4) begin
                        kernel_read <= 1'b1;
                    end else if (awaddr_reg >= ADDR_WORLD_BASE && awaddr_reg < ADDR_WORLD_BASE + SIZE*SIZE*4) begin
                        world_read <= 1'b1;
                    end else if (awaddr_reg == ADDR_CONTROL) begin
                        // Control register write (e.g., start convolution)
                        if (wdata_reg[0]) begin
                            // Trigger convolution
                            state <= IDLE;
                        end
                    end
                end
                if (s_axi_bready && s_axi_bvalid) begin
                    s_axi_bvalid <= 1'b0;
                    state <= IDLE;
                end
            end

            READ: begin
                s_axi_arready <= 1'b0;
                if (!s_axi_rvalid) begin
                    s_axi_rvalid <= 1'b1;
                    s_axi_rresp <= 2'b00; // OKAY response
                    // Read data from the appropriate memory
                    if (araddr_reg >= ADDR_RESULT_BASE && araddr_reg < ADDR_RESULT_BASE + SIZE*SIZE*4) begin
                        index = (araddr_reg - ADDR_RESULT_BASE) / 4;
                        s_axi_rdata <= result[index / SIZE][index % SIZE];
                    end else begin
                        s_axi_rdata <= 32'b0;
                    end
                end
                if (s_axi_rready && s_axi_rvalid) begin
                    s_axi_rvalid <= 1'b0;
                    state <= IDLE;
                end
            end
        endcase
    end
end

endmodule
