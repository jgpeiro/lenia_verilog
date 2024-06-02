`timescale 1ns / 1ps

//python file_monitor.py -f axi4_systolic_array.v -f axi4_systolic_array_tb.v -t 0.1
/*
module axi4_systolic_array_tb;

    // Testbench parameters
    parameter SIZE = 4;

    // Clock and reset signals
    reg clk;
    reg resetn;

    // AXI4-Lite slave interface signals
    reg [31:0] s_axi_awaddr;
    reg s_axi_awvalid;
    wire s_axi_awready;
    reg [31:0] s_axi_wdata;
    reg [3:0] s_axi_wstrb;
    reg s_axi_wvalid;
    wire s_axi_wready;
    wire [1:0] s_axi_bresp;
    wire s_axi_bvalid;
    reg s_axi_bready;
    reg [31:0] s_axi_araddr;
    reg s_axi_arvalid;
    wire s_axi_arready;
    wire [31:0] s_axi_rdata;
    wire [1:0] s_axi_rresp;
    wire s_axi_rvalid;
    reg s_axi_rready;

    // Systolic array instance
    axi4_systolic_array #(
        .SIZE(SIZE)
    ) uut (
        .clk(clk),
        .resetn(resetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .done(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end
    
    integer i, j, idx;
    // Test procedure
    initial begin
        $dumpfile( "axi4_systolic_array_tb.vcd" );
        $dumpvars( 0, axi4_systolic_array_tb );
        //for (idx = 0; idx < 2; idx = idx + 1) $dumpvars(0, uut.result[idx][0]); 
        // Initialize signals
        resetn = 0;
        s_axi_awaddr = 0;
        s_axi_awvalid = 0;
        s_axi_wdata = 0;
        s_axi_wstrb = 4'b1111;
        s_axi_wvalid = 0;
        s_axi_bready = 0;
        s_axi_araddr = 0;
        s_axi_arvalid = 0;
        s_axi_rready = 0;

        // Apply reset
        #10;
        resetn = 1;
        #10;

        // Write kernel data
        for (i = 0; i < SIZE; i++) begin
            for ( j = 0; j < SIZE; j++) begin
                axi_write(32'h0000_0000 + ((i * SIZE + j) * 4), i + j);
            end
        end

        // Write world data
        for (i = 0; i < SIZE; i++) begin
            for (j = 0; j < SIZE; j++) begin
                axi_write(32'h0000_1000 + ((i * SIZE + j) * 4), i * j);
            end
        end

        // Trigger convolution operation
        axi_write(32'h0000_2000, 32'h0000_0001);

        // Wait for convolution to complete
        #1000;

        // Read and check result data
        for (i = 0; i < SIZE; i++) begin
            for (j = 0; j < SIZE; j++) begin
                axi_read(32'h0000_3000 + ((i * SIZE + j) * 4));
            end
        end

        // End simulation
        //$stop;
        $finish;
    end

    // AXI write task
    task axi_write(input [31:0] addr, input [31:0] data);
        begin
            // Write address
            @(posedge clk);
            s_axi_awaddr = addr;
            s_axi_awvalid = 1;
            @(posedge clk);
            s_axi_awvalid = 0;

            // Write data
            @(posedge clk);
            s_axi_wdata = data;
            s_axi_wvalid = 1;
            @(posedge clk);
            s_axi_wvalid = 0;

            // Wait for write response
            s_axi_bready = 1;
            @(posedge clk);
            s_axi_bready = 0;
        end
    endtask

    // AXI read task
    task axi_read(input [31:0] addr);
        begin
            // Read address
            @(posedge clk);
            s_axi_araddr = addr;
            s_axi_arvalid = 1;
            @(posedge clk);
            s_axi_arvalid = 0;

            // Wait for read data
            s_axi_rready = 1;
            @(posedge clk);
            s_axi_rready = 0;

            // Display read data
            @(posedge clk);
            $display("Read Data from %h: %h", addr, s_axi_rdata);
        end
    endtask

endmodule
*/


/*
`timescale 1ns / 1ps

module axi4_systolic_array_tb;

    // Parameters
    parameter SIZE = 32;
    
    // Inputs
    reg clk;
    reg resetn;
    reg [31:0] s_axi_awaddr;
    reg s_axi_awvalid;
    reg [31:0] s_axi_wdata;
    reg [3:0] s_axi_wstrb;
    reg s_axi_wvalid;
    reg s_axi_bready;
    reg [31:0] s_axi_araddr;
    reg s_axi_arvalid;
    reg s_axi_rready;
    reg [31:0] kernel_data;
    reg [31:0] world_data;

    // Outputs
    wire s_axi_awready;
    wire s_axi_wready;
    wire [1:0] s_axi_bresp;
    wire s_axi_bvalid;
    wire s_axi_arready;
    wire [31:0] s_axi_rdata;
    wire [1:0] s_axi_rresp;
    wire s_axi_rvalid;
    wire done;
    wire kernel_read;
    wire world_read;

    // Instantiate the Unit Under Test (UUT)
    axi4_systolic_array #(SIZE) uut (
        .clk(clk), 
        .resetn(resetn), 
        .s_axi_awaddr(s_axi_awaddr), 
        .s_axi_awvalid(s_axi_awvalid), 
        .s_axi_awready(s_axi_awready), 
        .s_axi_wdata(s_axi_wdata), 
        .s_axi_wstrb(s_axi_wstrb), 
        .s_axi_wvalid(s_axi_wvalid), 
        .s_axi_wready(s_axi_wready), 
        .s_axi_bresp(s_axi_bresp), 
        .s_axi_bvalid(s_axi_bvalid), 
        .s_axi_bready(s_axi_bready), 
        .s_axi_araddr(s_axi_araddr), 
        .s_axi_arvalid(s_axi_arvalid), 
        .s_axi_arready(s_axi_arready), 
        .s_axi_rdata(s_axi_rdata), 
        .s_axi_rresp(s_axi_rresp), 
        .s_axi_rvalid(s_axi_rvalid), 
        .s_axi_rready(s_axi_rready), 
        .done(done), 
        .kernel_data(kernel_data), 
        .kernel_read(kernel_read), 
        .world_data(world_data), 
        .world_read(world_read)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test sequence
    initial begin
        $dumpfile( "axi4_systolic_array_tb.vcd" );
        $dumpvars( 0, axi4_systolic_array_tb );
    
        // Initialize Inputs
        resetn = 0;
        s_axi_awaddr = 0;
        s_axi_awvalid = 0;
        s_axi_wdata = 0;
        s_axi_wstrb = 0;
        s_axi_wvalid = 0;
        s_axi_bready = 0;
        s_axi_araddr = 0;
        s_axi_arvalid = 0;
        s_axi_rready = 0;
        kernel_data = 0;
        world_data = 0;

        // Apply reset
        #10;
        resetn = 1;
        #10;
        resetn = 0;
        #20;
        resetn = 1;

        // Wait for the reset to be released
        #20;

        // Write kernel data
        s_axi_awaddr = 32'h0000_0000; // Address for kernel base
        s_axi_awvalid = 1;
        s_axi_wdata = 32'h0000_0001; // Example kernel data
        s_axi_wstrb = 4'b1111;
        s_axi_wvalid = 1;
        s_axi_bready = 1;

        #10;
        s_axi_awvalid = 0;
        s_axi_wvalid = 0;
        
        // Write world data
        s_axi_awaddr = 32'h0000_1000; // Address for world base
        s_axi_awvalid = 1;
        s_axi_wdata = 32'h0000_0002; // Example world data
        s_axi_wstrb = 4'b1111;
        s_axi_wvalid = 1;

        #10;
        s_axi_awvalid = 0;
        s_axi_wvalid = 0;

        // Start convolution
        s_axi_awaddr = 32'h0000_2000; // Address for control
        s_axi_awvalid = 1;
        s_axi_wdata = 32'h0000_0001; // Start signal
        s_axi_wstrb = 4'b1111;
        s_axi_wvalid = 1;

        #10;
        s_axi_awvalid = 0;
        s_axi_wvalid = 0;

        // Wait for convolution to complete
        wait(done);

        // Read result data
        s_axi_araddr = 32'h0000_3000; // Address for result base
        s_axi_arvalid = 1;
        s_axi_rready = 1;

        #10;
        s_axi_arvalid = 0;

        // Wait for read valid signal
        wait(s_axi_rvalid);
        
        // Display the result
        $display("Result: %h", s_axi_rdata);

        // Finish simulation
        #100;
        $finish;
    end
endmodule

*/

`timescale 1ns / 1ps

module axi4_systolic_array_tb;
    // Parameters
    localparam SIZE = 3;

    // Signals
    reg clk;
    reg resetn;
    reg [31:0] s_axi_awaddr;
    reg s_axi_awvalid;
    wire s_axi_awready;
    reg [31:0] s_axi_wdata;
    reg [3:0] s_axi_wstrb;
    reg s_axi_wvalid;
    wire s_axi_wready;
    wire [1:0] s_axi_bresp;
    wire s_axi_bvalid;
    reg s_axi_bready;
    reg [31:0] s_axi_araddr;
    reg s_axi_arvalid;
    wire s_axi_arready;
    wire [31:0] s_axi_rdata;
    wire [1:0] s_axi_rresp;
    wire s_axi_rvalid;
    reg s_axi_rready;
    wire done;
    reg [31:0] kernel_data;
    wire kernel_read;
    reg [31:0] world_data;
    wire world_read;

    // Instantiate the unit under test (UUT)
    axi4_systolic_array #(
        .SIZE(SIZE)
    ) uut (
        .clk(clk),
        .resetn(resetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .done(done),
        .kernel_data(kernel_data),
        .kernel_read(kernel_read),
        .world_data(world_data),
        .world_read(world_read)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end
    integer i; 
    // Testbench logic
    initial begin
        $dumpfile( "axi4_systolic_array_tb.vcd" );
        $dumpvars( 0, axi4_systolic_array_tb );
        
        // Initialize signals
        resetn = 0;
        s_axi_awaddr = 0;
        s_axi_awvalid = 0;
        s_axi_wdata = 0;
        s_axi_wstrb = 0;
        s_axi_wvalid = 0;
        s_axi_bready = 0;
        s_axi_araddr = 0;
        s_axi_arvalid = 0;
        s_axi_rready = 0;
        kernel_data = 0;
        world_data = 0;
        
        // Apply reset
        #10 resetn = 1;

        // Load kernel data
        s_axi_awaddr = 32'h0000_0000;
        for ( i = 0; i < SIZE * SIZE; i = i + 1) begin
            s_axi_awvalid = 1;
            s_axi_wdata = i + 1; // Example data
            s_axi_wvalid = 1;
            @(posedge clk);
            //while (!s_axi_awready || !s_axi_wready) @(posedge clk);
            #20
            s_axi_awvalid = 0;
            s_axi_wvalid = 0;
            @(posedge clk);
        end

        // Load world data
        s_axi_awaddr = 32'h0000_1000;
        for ( i = 0; i < SIZE * SIZE; i = i + 1) begin
            s_axi_awvalid = 1;
            s_axi_wdata = (i + 1) * 10; // Example data
            s_axi_wvalid = 1;
            @(posedge clk);
            //while (!s_axi_awready || !s_axi_wready) @(posedge clk);
            #20
            s_axi_awvalid = 0;
            s_axi_wvalid = 0;
            @(posedge clk);
        end

        // Trigger convolution
        s_axi_awaddr = 32'h0000_2000;
        s_axi_awvalid = 1;
        s_axi_wdata = 1; // Start convolution
        s_axi_wvalid = 1;
        @(posedge clk);
        //while (!s_axi_awready || !s_axi_wready) @(posedge clk);
        #20
        s_axi_awvalid = 0;
        s_axi_wvalid = 0;
        @(posedge clk);

        // Wait for done signal
        //while (!done) @(posedge clk);
        #100

        // Read and verify results
        s_axi_araddr = 32'h0000_3000;
        for ( i = 0; i < SIZE * SIZE; i = i + 1) begin
            s_axi_arvalid = 1;
            @(posedge clk);
            //while (!s_axi_arready) @(posedge clk);
            #20
            s_axi_arvalid = 0;
            //while (!s_axi_rvalid) @(posedge clk);
            #20
            s_axi_rready = 1;
            @(posedge clk);
            s_axi_rready = 0;
            // Check s_axi_rdata against expected value here
            $display("Result[%0d] = %d", i, s_axi_rdata);
        end
 
        // Finish simulation
        $finish;
    end
endmodule
