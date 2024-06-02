`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 10:37:51 PM
// Design Name: 
// Module Name: axi_pwm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_pwm (
    input wire         clk,
    input wire         resetn,
    // AXI4-Lite slave interface
    input wire [31:0]  s_axi_awaddr,
    input wire         s_axi_awvalid,
    output wire        s_axi_awready,
    input wire [31:0]  s_axi_wdata,
    input wire [3:0]   s_axi_wstrb,
    input wire         s_axi_wvalid,
    output wire        s_axi_wready,
    output wire [1:0]  s_axi_bresp,
    output wire        s_axi_bvalid,
    input wire         s_axi_bready,
    input wire [31:0]  s_axi_araddr,
    input wire         s_axi_arvalid,
    output wire        s_axi_arready,
    output wire [31:0] s_axi_rdata,
    output wire [1:0]  s_axi_rresp,
    output wire        s_axi_rvalid,
    input wire         s_axi_rready,
    // PWM output
    output wire        pwm_out
);

    // AXI4-Lite signals
    reg awready_reg, wready_reg, bvalid_reg, arready_reg, rvalid_reg;
    reg [31:0] rdata_reg;
    reg [31:0] duty_cycle_reg;  // Duty cycle register (0-100)
    
    assign s_axi_awready = awready_reg;
    assign s_axi_wready = wready_reg;
    assign s_axi_bvalid = bvalid_reg;
    assign s_axi_bresp = 2'b00;  // OKAY response
    assign s_axi_arready = arready_reg;
    assign s_axi_rvalid = rvalid_reg;
    assign s_axi_rdata = rdata_reg;
    assign s_axi_rresp = 2'b00;  // OKAY response

    // Write address handshake
    always @(posedge clk) begin
        if (!resetn) begin
            awready_reg <= 1'b0;
        end else if (s_axi_awvalid && !awready_reg) begin
            awready_reg <= 1'b1;
        end else begin
            awready_reg <= 1'b0;
        end
    end

    // Write data handshake
    always @(posedge clk) begin
        if (!resetn) begin
            wready_reg <= 1'b0;
        end else if (s_axi_wvalid && !wready_reg) begin
            wready_reg <= 1'b1;
        end else begin
            wready_reg <= 1'b0;
        end
    end

    // Write response
    always @(posedge clk) begin
        if (!resetn) begin
            bvalid_reg <= 1'b0;
        end else if (s_axi_wvalid && s_axi_wready && s_axi_awvalid && s_axi_awready) begin
            bvalid_reg <= 1'b1;
        end else if (s_axi_bready && bvalid_reg) begin
            bvalid_reg <= 1'b0;
        end
    end

    // Write logic
    always @(posedge clk) begin
        if (!resetn) begin
            duty_cycle_reg <= 32'b0;
        end else if (s_axi_awvalid && s_axi_awready && s_axi_wvalid && s_axi_wready) begin
            if (s_axi_awaddr == 32'h00000000) begin
                duty_cycle_reg <= s_axi_wdata;
            end
        end
    end

    // Read address handshake
    always @(posedge clk) begin
        if (!resetn) begin
            arready_reg <= 1'b0;
        end else if (s_axi_arvalid && !arready_reg) begin
            arready_reg <= 1'b1;
        end else begin
            arready_reg <= 1'b0;
        end
    end

    // Read data valid
    always @(posedge clk) begin
        if (!resetn) begin
            rvalid_reg <= 1'b0;
        end else if (s_axi_arvalid && s_axi_arready) begin
            rvalid_reg <= 1'b1;
        end else if (s_axi_rready && rvalid_reg) begin
            rvalid_reg <= 1'b0;
        end
    end

    // Read logic
    always @(posedge clk) begin
        if (!resetn) begin
            rdata_reg <= 32'b0;
        end else if (s_axi_arvalid && s_axi_arready) begin
            if (s_axi_araddr == 32'h00000000) begin
                rdata_reg <= duty_cycle_reg;
            end
        end
    end

    // PWM generation logic
    reg [31:0] counter;
    always @(posedge clk) begin
        if (!resetn) begin
            counter <= 32'b0;
        end else begin
            counter <= counter + 1;
        end
    end

    assign pwm_out = (counter < duty_cycle_reg) ? 1'b1 : 1'b0;

endmodule

