`timescale 1ns / 1ps
// cd C:\git\lenia_verilog\zynq
// python file_monitor.py -f axi4_gpio.v -f axi4_gpio_tb.v -t 0.1

/* 
module axi4_gpio_tb;
    reg         clk;
    reg         resetn;
    reg [31:0]  axi_awaddr;
    reg         axi_awvalid;
    wire        axi_awready;
    reg [31:0]  axi_wdata;
    reg [3:0]   axi_wstrb;
    reg         axi_wvalid;
    wire        axi_wready;
    wire [1:0]  axi_bresp;
    wire        axi_bvalid;
    reg         axi_bready;
    reg [31:0]  axi_araddr;
    reg         axi_arvalid;
    wire        axi_arready;
    wire [31:0] axi_rdata;
    wire [1:0]  axi_rresp;
    wire        axi_rvalid;
    reg         axi_rready;
    wire [31:0] gpio_out;
    reg [31:0]  gpio_in;

    // Instantiate the DUT
    axi4_gpio uut (
        .clk(clk),
        .resetn(resetn),
        .axi_awaddr(axi_awaddr),
        .axi_awvalid(axi_awvalid),
        .axi_awready(axi_awready),
        .axi_wdata(axi_wdata),
        .axi_wstrb(axi_wstrb),
        .axi_wvalid(axi_wvalid),
        .axi_wready(axi_wready),
        .axi_bresp(axi_bresp),
        .axi_bvalid(axi_bvalid),
        .axi_bready(axi_bready),
        .axi_araddr(axi_araddr),
        .axi_arvalid(axi_arvalid),
        .axi_arready(axi_arready),
        .axi_rdata(axi_rdata),
        .axi_rresp(axi_rresp),
        .axi_rvalid(axi_rvalid),
        .axi_rready(axi_rready),
        .gpio_out(gpio_out),
        .gpio_in(gpio_in)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $dumpfile( "axi4_gpio_tb.vcd" );
        $dumpvars( 0, axi4_gpio_tb );
    
        // Initial state
        resetn = 0;
        axi_awaddr = 0;
        axi_awvalid = 0;
        axi_wdata = 0;
        axi_wstrb = 4'b1111;
        axi_wvalid = 0;
        axi_bready = 0;
        axi_araddr = 0;
        axi_arvalid = 0;
        axi_rready = 0;
        gpio_in = 32'hDEADBEEF;

        // Reset
        #20;
        resetn = 1;

        // Write to GPIO
        #20;
        axi_awaddr = 32'h0;
        axi_awvalid = 1;
        axi_wdata = 32'hA5A5A5A5;
        axi_wvalid = 1;

        // Wait for write to complete
        #20;
        axi_awvalid = 0;
        axi_wvalid = 0;
        axi_bready = 1;
        #10;
        axi_bready = 0;

        // Read from GPIO
        #20;
        axi_araddr = 32'h0;
        axi_arvalid = 1;
        axi_rready = 1;

        // Wait for read to complete
        #20;
        axi_arvalid = 0;
        axi_rready = 0;

        // End simulation
        #100;
        $finish;
    end
endmodule
*/

/*
module axi4_gpio_tb;
    reg         clk;
    reg         resetn;
    reg [31:0]  axi_awaddr;
    reg         axi_awvalid;
    wire        axi_awready;
    reg [31:0]  axi_wdata;
    reg [3:0]   axi_wstrb;
    reg         axi_wvalid;
    wire        axi_wready;
    wire [1:0]  axi_bresp;
    wire        axi_bvalid;
    reg         axi_bready;
    reg [31:0]  axi_araddr;
    reg         axi_arvalid;
    wire        axi_arready;
    wire [31:0] axi_rdata;
    wire [1:0]  axi_rresp;
    wire        axi_rvalid;
    reg         axi_rready;
    wire [31:0] gpio_out;
    reg [31:0]  gpio_in;

    // Instantiate the DUT
    axi4_gpio uut (
        .clk(clk),
        .resetn(resetn),
        .axi_awaddr(axi_awaddr),
        .axi_awvalid(axi_awvalid),
        .axi_awready(axi_awready),
        .axi_wdata(axi_wdata),
        .axi_wstrb(axi_wstrb),
        .axi_wvalid(axi_wvalid),
        .axi_wready(axi_wready),
        .axi_bresp(axi_bresp),
        .axi_bvalid(axi_bvalid),
        .axi_bready(axi_bready),
        .axi_araddr(axi_araddr),
        .axi_arvalid(axi_arvalid),
        .axi_arready(axi_arready),
        .axi_rdata(axi_rdata),
        .axi_rresp(axi_rresp),
        .axi_rvalid(axi_rvalid),
        .axi_rready(axi_rready),
        .gpio_out(gpio_out),
        .gpio_in(gpio_in)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Task for AXI4 write transaction
    task axi_write(input [31:0] addr, input [31:0] data);
    begin
        axi_awaddr = addr;
        axi_awvalid = 1;
        axi_wdata = data;
        axi_wvalid = 1;
        axi_bready = 1;

        // Wait for AWREADY and WREADY
        wait (axi_awready && axi_wready);
        
        axi_awvalid = 0;
        axi_wvalid = 0;

        // Wait for BVALID and then deassert BREADY
        wait (axi_bvalid);
        axi_bready = 0;
    end
    endtask

    // Task for AXI4 read transaction
    task axi_read(input [31:0] addr, output [31:0] data);
    begin
        axi_araddr = addr;
        axi_arvalid = 1;
        axi_rready = 1;

        // Wait for ARREADY
        wait (axi_arready);
        axi_arvalid = 0;

        // Wait for RVALID
        wait (axi_rvalid);
        data = axi_rdata;
        axi_rready = 0;
    end
    endtask

    // Test sequence
    initial begin
        $dumpfile( "axi4_gpio_tb.vcd" );
        $dumpvars( 0, axi4_gpio_tb );
    
        // Initial state
        resetn = 0;
        axi_awaddr = 0;
        axi_awvalid = 0;
        axi_wdata = 0;
        axi_wstrb = 4'b1111;
        axi_wvalid = 0;
        axi_bready = 0;
        axi_araddr = 0;
        axi_arvalid = 0;
        axi_rready = 0;
        gpio_in = 32'hDEADBEEF;

        // Reset
        #20;
        resetn = 1;

        // Write to GPIO
        #20;
        axi_write(32'h0, 32'hA5A5A5A5);

        // Read from GPIO
        #20;
        axi_read(32'h0, axi_rdata);

        // Check GPIO input
        if (axi_rdata !== 32'hDEADBEEF) begin
            $display("ERROR: GPIO read data mismatch. Expected: 0xDEADBEEF, Got: 0x%0h", axi_rdata);
        end else begin
            $display("GPIO read data matches expected value.");
        end

        // End simulation
        #10;
        $finish;
    end
    
    initial begin
        #500;
        $finish;
    end
    
endmodule
*/

/*
module axi4_gpio_tb;
    reg         clk;
    reg         resetn;
    reg [31:0]  axi_awaddr;
    reg         axi_awvalid;
    wire        axi_awready;
    reg [31:0]  axi_wdata;
    reg [3:0]   axi_wstrb;
    reg         axi_wvalid;
    wire        axi_wready;
    wire [1:0]  axi_bresp;
    wire        axi_bvalid;
    reg         axi_bready;
    reg [31:0]  axi_araddr;
    reg         axi_arvalid;
    wire        axi_arready;
    wire [31:0] axi_rdata;
    wire [1:0]  axi_rresp;
    wire        axi_rvalid;
    reg         axi_rready;
    wire [31:0] gpio_out;
    reg [31:0]  gpio_in;

    // Instantiate the DUT
    axi4_gpio uut (
        .clk(clk),
        .resetn(resetn),
        .axi_awaddr(axi_awaddr),
        .axi_awvalid(axi_awvalid),
        .axi_awready(axi_awready),
        .axi_wdata(axi_wdata),
        .axi_wstrb(axi_wstrb),
        .axi_wvalid(axi_wvalid),
        .axi_wready(axi_wready),
        .axi_bresp(axi_bresp),
        .axi_bvalid(axi_bvalid),
        .axi_bready(axi_bready),
        .axi_araddr(axi_araddr),
        .axi_arvalid(axi_arvalid),
        .axi_arready(axi_arready),
        .axi_rdata(axi_rdata),
        .axi_rresp(axi_rresp),
        .axi_rvalid(axi_rvalid),
        .axi_rready(axi_rready),
        .gpio_out(gpio_out),
        .gpio_in(gpio_in)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Task for AXI4 write transaction
    task axi_write(input [31:0] addr, input [31:0] data);
    begin
        axi_awaddr = addr;
        axi_awvalid = 1;
        axi_wdata = data;
        axi_wvalid = 1;
        axi_bready = 1;

        // Wait for AWREADY and WREADY
        wait (axi_awready && axi_wready);
        
        axi_awvalid = 0;
        axi_wvalid = 0;

        // Wait for BVALID and then deassert BREADY
        wait (axi_bvalid);
        axi_bready = 0;
    end
    endtask

    // Task for AXI4 read transaction
    task axi_read(input [31:0] addr, output [31:0] data);
    begin
        axi_araddr = addr;
        axi_arvalid = 1;
        axi_rready = 1;

        // Wait for ARREADY
        wait (axi_arready);
        axi_arvalid = 0;

        // Wait for RVALID
        wait (axi_rvalid);
        data = axi_rdata;
        axi_rready = 0;
    end
    endtask

    // Test sequence
    initial begin
        $dumpfile( "axi4_gpio_tb.vcd" );
        $dumpvars( 0, axi4_gpio_tb );
    
        // Initial state
        resetn = 0;
        axi_awaddr = 0;
        axi_awvalid = 0;
        axi_wdata = 0;
        axi_wstrb = 4'b1111;
        axi_wvalid = 0;
        axi_bready = 0;
        axi_araddr = 0;
        axi_arvalid = 0;
        axi_rready = 0;
        gpio_in = 32'hDEADBEEF;

        // Reset
        #20;
        resetn = 1;

        // Write to GPIO
        #20;
        axi_write(32'h0, 32'hA5A5A5A5);

        // Read from GPIO
        #20;
        axi_read(32'h0, axi_rdata);

        // Check GPIO input
        if (axi_rdata !== 32'hDEADBEEF) begin
            $display("ERROR: GPIO read data mismatch. Expected: 0xDEADBEEF, Got: 0x%0h", axi_rdata);
        end else begin
            $display("GPIO read data matches expected value.");
        end

        // End simulation
        #10;
        $finish;
    end
    
    initial begin
        #500;
        $finish;
    end
    
endmodule
*/
/*
module axi4_gpio_tb;

    // Testbench signals
    reg         clk;
    reg         resetn;
    reg  [31:0] axi_awaddr;
    reg         axi_awvalid;
    wire        axi_awready;
    reg  [31:0] axi_wdata;
    reg  [3:0]  axi_wstrb;
    reg         axi_wvalid;
    wire        axi_wready;
    wire [1:0]  axi_bresp;
    wire        axi_bvalid;
    reg         axi_bready;
    reg  [31:0] axi_araddr;
    reg         axi_arvalid;
    wire        axi_arready;
    wire [31:0] axi_rdata;
    wire [1:0]  axi_rresp;
    wire        axi_rvalid;
    reg         axi_rready;
    wire [31:0] gpio_out;
    reg  [31:0] gpio_in;

    // Instantiate the DUT
    axi4_gpio dut (
        .clk(clk),
        .resetn(resetn),
        .axi_awaddr(axi_awaddr),
        .axi_awvalid(axi_awvalid),
        .axi_awready(axi_awready),
        .axi_wdata(axi_wdata),
        .axi_wstrb(axi_wstrb),
        .axi_wvalid(axi_wvalid),
        .axi_wready(axi_wready),
        .axi_bresp(axi_bresp),
        .axi_bvalid(axi_bvalid),
        .axi_bready(axi_bready),
        .axi_araddr(axi_araddr),
        .axi_arvalid(axi_arvalid),
        .axi_arready(axi_arready),
        .axi_rdata(axi_rdata),
        .axi_rresp(axi_rresp),
        .axi_rvalid(axi_rvalid),
        .axi_rready(axi_rready),
        .gpio_out(gpio_out),
        .gpio_in(gpio_in)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        #100;
        $finish;
    end
    
    // Testbench procedure
    initial begin
        $dumpfile( "axi4_gpio_tb.vcd" );
        $dumpvars( 0, axi4_gpio_tb );
    
        // Initialize signals
        $display("TB 467 Initialize signals %0t", $time);
        clk = 0;
        resetn = 0;
        //...;

        // Reset the DUT
        $display("TB 482 Reset the DUT %0t", $time);
        $display("TB 483 time = %0t", $time);
        #10 resetn = 1;
        $display("TB 485 time = %0t", $time);
        // Perform 4 write operations
        $display("TB 486 Perform 4 write operations %0t", $time);
        write_operation(32'h00001111, 32'hA5A5A5A5);
        write_operation(32'h00002222, 32'h5A5A5A5A);
        write_operation(32'h00000000, 32'h12345678);
        write_operation(32'h00004444, 32'h87654321);
 
        // Perform 4 read operations
        $display("TB 493 Perform 4 read operations %0t", $time);
        read_operation(32'h00001111);
        read_operation(32'h00002222);
        read_operation(32'h00000000); 
        read_operation(32'h00004444);

        // Finish simulation
        $display("500 finish");
        #50 
        $display("502 finish");
        $finish;
    end

    // Task for write operations
    task write_operation(input [31:0] addr, input [31:0] data);
    begin
        axi_awaddr = addr;
        axi_awvalid = 1;
        axi_wdata = data;
        axi_wvalid = 1;

        // Wait for AW and W handshakes
        //...

        // Wait for B handshake

        $display("Completed write operation to address %h with data %h", addr, data);
    end
    endtask

    // Task for read operations
    task read_operation(input [31:0] addr);
    begin
        $display("TB 534 Starting read operation from address %h", addr);
        axi_araddr = addr;
        axi_arvalid = 1;

        // Wait for AR handshake
        $display("TB 539 Wait for AW and W handshakes %0t", $time);
        wait(axi_arready);
        axi_arvalid = 0;

        // Wait for R handshake
        $display("TB 544 Wait for R handshake %0t", $time);
        axi_rready = 1;
        wait(axi_rvalid);
        axi_rready = 0;

        $display("TB 549 Completed read operation from address %h with data %h", addr, axi_rdata);
    end
    endtask

endmodule
*/

module axi4_gpio_tb();

    // Inputs
    reg clk;
    reg resetn;
    reg [31:0] axi_awaddr;
    reg axi_awvalid;
    reg [31:0] axi_wdata;
    reg [3:0] axi_wstrb;
    reg axi_wvalid;
    reg axi_bready;
    reg [31:0] axi_araddr;
    reg axi_arvalid;
    reg axi_rready;
    reg [31:0] gpio_in;

    // Outputs
    wire axi_awready;
    wire axi_wready;
    wire [1:0] axi_bresp;
    wire axi_bvalid;
    wire axi_arready;
    wire [31:0] axi_rdata;
    wire [1:0] axi_rresp;
    wire axi_rvalid;
    wire [31:0] gpio_out;

    // Instantiate the Unit Under Test (UUT)
    axi4_gpio uut (
        .clk(clk),
        .resetn(resetn),
        .axi_awaddr(axi_awaddr),
        .axi_awvalid(axi_awvalid),
        .axi_awready(axi_awready),
        .axi_wdata(axi_wdata),
        .axi_wstrb(axi_wstrb),
        .axi_wvalid(axi_wvalid),
        .axi_wready(axi_wready),
        .axi_bresp(axi_bresp),
        .axi_bvalid(axi_bvalid),
        .axi_bready(axi_bready),
        .axi_araddr(axi_araddr),
        .axi_arvalid(axi_arvalid),
        .axi_arready(axi_arready),
        .axi_rdata(axi_rdata),
        .axi_rresp(axi_rresp),
        .axi_rvalid(axi_rvalid),
        .axi_rready(axi_rready),
        .gpio_out(gpio_out),
        .gpio_in(gpio_in)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Testbench Procedure
    initial begin
        $dumpfile( "axi4_gpio_tb.vcd" );
        $dumpvars( 0, axi4_gpio_tb );
        
        // Initialize Inputs
        resetn = 0;
        axi_awaddr = 0;
        axi_awvalid = 0;
        axi_wdata = 0;
        axi_wstrb = 4'b1111;
        axi_wvalid = 0;
        axi_bready = 0;
        axi_araddr = 0;
        axi_arvalid = 0;
        axi_rready = 0;
        gpio_in = 32'hDEADBEEF;

        // Reset the UUT
        #10 resetn = 1;

        // Write transaction
        #20 
        axi_awaddr = 32'h0000AAAA;
        axi_awvalid = 1;
        wait (axi_awready==1);
        #10
        axi_awvalid = 0;
        
        #10
        axi_wdata = 32'h0000BBBB;
        axi_wvalid = 1;
        //#10
        wait (axi_wready);
        axi_wvalid = 0;
        
        
        #100
        axi_wdata = 32'hCAFEBABE;
        axi_wvalid = 1;
        #10 axi_awvalid = 0;
        axi_wvalid = 0;
        axi_bready = 1;
        wait (axi_bvalid);
        axi_bready = 0;

        // Read transaction
        #10 axi_araddr = 32'h00001234;
        axi_arvalid = 1;
        axi_rready = 1;
        #10 axi_arvalid = 0;
        wait (axi_rvalid);
        axi_rready = 0;

        // Wait for a while and then finish
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0d, gpio_out = %h, axi_rdata = %h", $time, gpio_out, axi_rdata);
    end

    initial begin
        #100;
        $finish;
    end

endmodule
