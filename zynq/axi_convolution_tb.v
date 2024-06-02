`timescale 1ns / 1ps

// cd C:\git\lenia_verilog\zynq
// python file_monitor.py -f axi_convolution.v -f axi_convolution_tb.v -t 0.1

module axi_convolution_tb;

  parameter integer C_S_AXI_DATA_WIDTH = 32;
  parameter integer C_S_AXI_ADDR_WIDTH = 7;
  parameter integer SIZE = 3;

  // Clock and Reset
  reg S_AXI_ACLK;
  reg S_AXI_ARESETN;

  // AXI4 Lite signals
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR;
  reg S_AXI_AWVALID;
  wire S_AXI_AWREADY;
  reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA;
  reg [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB;
  reg S_AXI_WVALID;
  wire S_AXI_WREADY;
  wire [1 : 0] S_AXI_BRESP;
  wire S_AXI_BVALID;
  reg S_AXI_BREADY;
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR;
  reg S_AXI_ARVALID;
  wire S_AXI_ARREADY;
  wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA;
  wire [1 : 0] S_AXI_RRESP;
  wire S_AXI_RVALID;
  reg S_AXI_RREADY;

  // Instantiate the AXI Convolution module
  axi_convolution #(
    .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
  ) dut (
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_BRESP(S_AXI_BRESP),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RREADY(S_AXI_RREADY)
  );

  // Clock generation
  initial begin
    S_AXI_ACLK = 0;
    forever #5 S_AXI_ACLK = ~S_AXI_ACLK;
  end

  // Reset generation
  initial begin
    S_AXI_ARESETN = 0;
    #20 S_AXI_ARESETN = 1;
    #20 S_AXI_ARESETN = 0;
    #20 S_AXI_ARESETN = 1;
 //   #20 S_AXI_ARESETN = 1;
  end

  // AXI write task
  task axi_write(
        input [C_S_AXI_ADDR_WIDTH-1:0] addr,
        input [C_S_AXI_DATA_WIDTH-1:0] data
    );
    begin
      $display("write %d %d", addr, data );
      @(posedge S_AXI_ACLK);
      S_AXI_AWADDR = addr;
      S_AXI_AWVALID = 1;
      S_AXI_WDATA = data;
      S_AXI_WSTRB = 4'b1111;
      S_AXI_WVALID = 1;

      while (~S_AXI_AWREADY || ~S_AXI_WREADY) @(posedge S_AXI_ACLK);
      S_AXI_AWVALID = 0;
      S_AXI_WVALID = 0;
      @(posedge S_AXI_ACLK);
      S_AXI_BREADY = 1;
      while (~S_AXI_BVALID) @(posedge S_AXI_ACLK);
      S_AXI_BREADY = 0;
    end
  endtask

  // AXI read task
  task axi_read( 
        input [C_S_AXI_ADDR_WIDTH-1:0] addr,
        output [C_S_AXI_DATA_WIDTH-1:0] data
    );
    begin
      @(posedge S_AXI_ACLK);
      S_AXI_ARADDR = addr;
      S_AXI_ARVALID = 1;
      while (~S_AXI_ARREADY) @(posedge S_AXI_ACLK);
      S_AXI_ARVALID = 0;
      @(posedge S_AXI_ACLK);
      S_AXI_RREADY = 1;
      while (~S_AXI_RVALID) @(posedge S_AXI_ACLK);
      data = S_AXI_RDATA;
      S_AXI_RREADY = 0;
      $display("read %d %d", addr, data );
    end
  endtask

initial begin
    $dumpfile( "axi_convolution_tb.vcd" );
    $dumpvars( 0, axi_convolution_tb );
    
    #2000;
    $display("finish");
    $finish;
end
reg [C_S_AXI_DATA_WIDTH-1:0] result;
  // Stimulus
  initial begin
    // Wait for reset deassertion
    $display("reset");
    S_AXI_AWADDR = 0;
    @(negedge S_AXI_ARESETN);
    @(posedge S_AXI_ARESETN);
    #40

    // Write kernel values
    $display("write kernel");
    axi_write(7'h00, 32'h00000001); // kernel[0][0] = 1
    axi_write(7'h04, 32'h00000002); // kernel[0][1] = 2
    axi_write(7'h08, 32'h00000003); // kernel[0][2] = 3
    axi_write(7'h0C, 32'h00000004); // kernel[1][0] = 4
    axi_write(7'h10, 32'h00000005); // kernel[1][1] = 5
    axi_write(7'h14, 32'h00000006); // kernel[1][2] = 6
    axi_write(7'h18, 32'h00000007); // kernel[2][0] = 7
    axi_write(7'h1C, 32'h00000008); // kernel[2][1] = 8
    axi_write(7'h20, 32'h00000009); // kernel[2][2] = 9
    #40
    
    // Write world values
    $display("write world");
    axi_write(7'h24, 32'h00000001); // world[0][0] = 1
    axi_write(7'h28, 32'h00000002); // world[0][1] = 2
    axi_write(7'h2C, 32'h00000003); // world[0][2] = 3
    axi_write(7'h30, 32'h00000004); // world[1][0] = 4
    axi_write(7'h34, 32'h00000005); // world[1][1] = 5
    axi_write(7'h38, 32'h00000006); // world[1][2] = 6
    axi_write(7'h3C, 32'h00000007); // world[2][0] = 7
    axi_write(7'h40, 32'h00000008); // world[2][1] = 8
    axi_write(7'h44, 32'h00000009); // world[2][2] = 9
    #40

    // Write indices i and j
    $display("write indexes");
    axi_write(7'h48, 32'h00000001); // i = 1
    axi_write(7'h4C, 32'h00000001); // j = 1
    #40

    // Start convolution
    $display("start");
    axi_write(7'h50, 32'h00000001); // start_convolution = 1
    #40

    // Wait for the convolution to complete
    #40;

    // Read convolution result
    
    $display("read");
    axi_read(7'h54, result);
    #40

    // Display result
    $display("44Convolution result: %d", result);

    // Finish simulation
    //$stop;
    $display("finish");
    $finish;
  end

endmodule
