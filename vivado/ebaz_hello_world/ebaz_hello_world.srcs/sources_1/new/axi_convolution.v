`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2024 07:10:58 PM
// Design Name: 
// Module Name: axi_convolution
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


module axi_convolution #(
  parameter integer C_S_AXI_DATA_WIDTH = 32,
  parameter integer C_S_AXI_ADDR_WIDTH = 7
)
(
  input wire  S_AXI_ACLK,
  input wire  S_AXI_ARESETN,
  input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
  input wire  S_AXI_AWVALID,
  output wire  S_AXI_AWREADY,
  input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
  input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
  input wire  S_AXI_WVALID,
  output wire  S_AXI_WREADY,
  output wire [1 : 0] S_AXI_BRESP,
  output wire  S_AXI_BVALID,
  input wire  S_AXI_BREADY,
  input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
  input wire  S_AXI_ARVALID,
  output wire  S_AXI_ARREADY,
  output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
  output wire [1 : 0] S_AXI_RRESP,
  output wire  S_AXI_RVALID,
  input wire  S_AXI_RREADY
);

    localparam integer ADDR_LSB = 2;
    localparam integer OPT_MEM_ADDR_BITS = 5;  // This depends on your address space size

  parameter integer SIZE = 3;
  
  // AXI4 Lite signals
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_awaddr;
  reg axi_awready;
  reg axi_wready;
  reg [1 : 0] axi_bresp;
  reg axi_bvalid;
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_araddr;
  reg axi_arready;
  reg [C_S_AXI_DATA_WIDTH-1 : 0] axi_rdata;
  reg [1 : 0] axi_rresp;
  reg axi_rvalid;

  // AXI4 Lite internal signals
  reg [C_S_AXI_DATA_WIDTH-1:0] reg_data_out;
  reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg0;
  //reg slv_reg_wren;
  reg slv_reg_wren  = 1; //??
  
  // Registers to store kernel and world matrices
  reg [31:0] kernel [0:SIZE-1][0:SIZE-1];
  reg [31:0] world [0:SIZE-1][0:SIZE-1];
  reg [31:0] slv_reg_i;
  reg [31:0] slv_reg_j;
  reg start_convolution;
  reg [31:0] convolution_result;
  
  // Address decoding
  wire [C_S_AXI_ADDR_WIDTH-1:0] axi_addr;
  assign axi_addr = S_AXI_AWADDR;
  
  // I/O Connections assignments
  assign S_AXI_AWREADY = axi_awready;
  assign S_AXI_WREADY  = axi_wready;
  assign S_AXI_BRESP   = axi_bresp;
  assign S_AXI_BVALID  = axi_bvalid;
  assign S_AXI_ARREADY = axi_arready;
  assign S_AXI_RDATA   = axi_rdata;
  assign S_AXI_RRESP   = axi_rresp;
  assign S_AXI_RVALID  = axi_rvalid;

  // Implement axi_awready generation
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
      begin
        axi_awready <= 1'b0;
      end 
    else
      begin    
        if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
          begin
            axi_awready <= 1'b1;
          end
        else           
          begin
            axi_awready <= 1'b0;
          end
      end 
  end       

  // Implement axi_wready generation
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
      begin
        axi_wready <= 1'b0;
      end 
    else
      begin    
        if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
          begin
            axi_wready <= 1'b1;
          end
        else
          begin
            axi_wready <= 1'b0;
          end
      end 
  end       

  // Implement write response logic generation
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
      begin
        axi_bvalid  <= 1'b0;
        axi_bresp   <= 2'b0;
      end 
    else
      begin    
        if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
          begin
            axi_bvalid <= 1'b1;
            axi_bresp  <= 2'b0; // 'OKAY' response 
          end                   
        else
          begin
            if (S_AXI_BREADY && axi_bvalid) 
              begin
                axi_bvalid <= 1'b0; 
              end  
          end
      end
  end   

  // Implement axi_arready generation
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
      begin
        axi_arready <= 1'b0;
        axi_araddr  <= 32'b0;
      end 
    else
      begin    
        if (~axi_arready && S_AXI_ARVALID)
          begin
            axi_arready <= 1'b1;
            axi_araddr  <= S_AXI_ARADDR;
          end
        else
          begin
            axi_arready <= 1'b0;
          end
      end 
  end       

  // Implement axi_rvalid generation
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
      begin
        axi_rvalid <= 1'b0;
        axi_rresp  <= 2'b0;
      end 
    else
      begin    
        if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
          begin
            axi_rvalid <= 1'b1;
            axi_rresp  <= 2'b0; // 'OKAY' response
          end   
        else if (axi_rvalid && S_AXI_RREADY)
          begin
            axi_rvalid <= 1'b0;
          end                
      end
  end   

  // Implement memory mapped register select and read logic generation
  always @(*)
  begin
  $display("wwwww %d", axi_araddr );
    //case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
    //case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
    case ( axi_araddr )
      4'h0   : reg_data_out <= kernel[0][0];
      4'h1   : reg_data_out <= kernel[0][1];
      4'h2   : reg_data_out <= kernel[0][2];
      4'h3   : reg_data_out <= kernel[1][0];
      4'h4   : reg_data_out <= kernel[1][1];
      4'h5   : reg_data_out <= kernel[1][2];
      4'h6   : reg_data_out <= kernel[2][0];
      4'h7   : reg_data_out <= kernel[2][1];
      4'h8   : reg_data_out <= kernel[2][2];
      4'h9   : reg_data_out <= world[0][0];
      4'hA   : reg_data_out <= world[0][1];
      4'hB   : reg_data_out <= world[0][2];
      4'hC   : reg_data_out <= world[1][0];
      4'hD   : reg_data_out <= world[1][1];
      4'hE   : reg_data_out <= world[1][2];
      4'hF   : reg_data_out <= world[2][0];
      5'h10  : reg_data_out <= world[2][1];
      5'h11  : reg_data_out <= world[2][2];
      5'h12  : reg_data_out <= slv_reg_i;
      5'h13  : reg_data_out <= slv_reg_j;
      5'h14  : reg_data_out <= {31'b0, start_convolution};
      5'h15  : begin 
        reg_data_out <= convolution_result;
      $display("w222");
      end
      default: reg_data_out <= 0;
    endcase
  end

  // Output register or memory read data
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
      begin
        axi_rdata  <= 0;
      end 
    else
      begin    
        if (axi_arready && S_AXI_ARVALID)
          begin
            axi_rdata <= reg_data_out;     
          end   
      end
  end   
integer m, n;
  // AXI write logic
  always @(posedge S_AXI_ACLK)
  begin
    if (S_AXI_ARESETN == 1'b0)
      begin
        
        for (m = 0; m < SIZE; m = m + 1)
          begin
            for (n = 0; n < SIZE; n = n + 1)
              begin
                kernel[m][n] <= 0;
                world[m][n] <= 0;
              end
          end
        slv_reg_i <= 0;
        slv_reg_j <= 0;
        start_convolution <= 0;
      end 
    else
      begin
        if (slv_reg_wren)
          begin
          //$display("qqq %d %d, %d", ADDR_LSB, OPT_MEM_ADDR_BITS, S_AXI_AWADDR );
            case (axi_awaddr)//[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
            //case (axi_awaddr[3:0])
              4'h0: kernel[0][0] <= S_AXI_WDATA;
              4: begin kernel[0][1] <= S_AXI_WDATA;
              $display("rrrrrr");
              end
              4'h8: kernel[0][2] <= S_AXI_WDATA;
              4'h3: kernel[1][0] <= S_AXI_WDATA;
              4'h4: kernel[1][1] <= S_AXI_WDATA;
              4'h5: kernel[1][2] <= S_AXI_WDATA;
              4'h6: kernel[2][0] <= S_AXI_WDATA;
              4'h7: kernel[2][1] <= S_AXI_WDATA;
              4'h8: kernel[2][2] <= S_AXI_WDATA;
              4'h9: world[0][0] <= S_AXI_WDATA;
              4'hA: world[0][1] <= S_AXI_WDATA;
              4'hB: world[0][2] <= S_AXI_WDATA;
              4'hC: world[1][0] <= S_AXI_WDATA;
              4'hD: world[1][1] <= S_AXI_WDATA;
              4'hE: world[1][2] <= S_AXI_WDATA;
              4'hF: world[2][0] <= S_AXI_WDATA;
              5'h10: world[2][1] <= S_AXI_WDATA;
              5'h11: world[2][2] <= S_AXI_WDATA;
              5'h12: slv_reg_i <= S_AXI_WDATA;
              5'h13: slv_reg_j <= S_AXI_WDATA;
              5'h14: start_convolution <= S_AXI_WDATA[0];
              default: ;
            endcase
          end
      end
  end
	integer k, l;
  integer x, y;
  reg [31:0] sum;
  // Convolution logic
  always @(posedge S_AXI_ACLK)
  begin
    if (S_AXI_ARESETN == 1'b0)
      begin
        convolution_result <= 0;
      end 
    else
      begin
        if (start_convolution)
          begin
            

            
            sum <= 0;
            for (k = 0; k < SIZE; k = k + 1)
              begin
                for (l = 0; l < SIZE; l = l + 1)
                  begin
                    x = slv_reg_i + k - SIZE/2;
                    y = slv_reg_j + l - SIZE/2;
                    if (0 <= x && x < SIZE && 0 <= y && y < SIZE)
                      begin
                        sum <= sum + kernel[k][l] * world[x][y];
                      end
                  end
              end
            convolution_result <= sum;
          end
      end
  end

endmodule

