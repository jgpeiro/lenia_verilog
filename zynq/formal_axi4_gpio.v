module formal_axi4_gpio (
    input wire         clk,
    input wire         resetn,
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    input wire         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    input wire         axi_wready,
    input wire [1:0]   axi_bresp,
    input wire         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    input wire         axi_arready,
    input wire [31:0]  axi_rdata,
    input wire [1:0]   axi_rresp,
    input wire         axi_rvalid,
    input wire         axi_rready,
    input wire [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);

    // Assertions for reset behavior
    initial begin
        assert (resetn == 0) else $fatal("Reset is not active initially");
    end

    // Assertion: AWREADY should be high if AWVALID is high and we are in IDLE state
    always @(posedge clk) begin
        if (resetn) begin
            assert (axi_awready == (axi_awvalid && axi_wvalid));
        end
    end
    
    // Assertion: GPIO output should be written correctly
    always @(posedge clk) begin
        if (resetn && axi_awvalid && axi_wvalid && axi_awready && axi_wready) begin
            if (axi_awaddr == 32'h0) begin
                assert (gpio_out == axi_wdata);
            end
        end
    end

    // Assertion: RDATA should return GPIO input correctly
    always @(posedge clk) begin
        if (resetn && axi_arvalid && axi_arready) begin
            if (axi_araddr == 32'h0) begin
                assert (axi_rdata == gpio_in);
            end
        end
    end

endmodule




module axi4_gpio_fv (
    input wire         clk,
    input wire         resetn,
    // AXI4-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    input wire         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    input wire         axi_wready,
    input wire [1:0]   axi_bresp,
    input wire         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    input wire         axi_arready,
    input wire [31:0]  axi_rdata,
    input wire [1:0]   axi_rresp,
    input wire         axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    input wire [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);

    // Assertion: Reset behavior
    // Ensure that all outputs are de-asserted when reset is active
    property reset_behavior;
        @(posedge clk) disable iff (!resetn)
        !resetn |-> (axi_awready == 0) && (axi_wready == 0) && 
                   (axi_bvalid == 0) && (axi_arready == 0) &&
                   (axi_rvalid == 0);
    endproperty
    assert property (reset_behavior);

    // Assertion: Write Address Handshake
    // When AWVALID is asserted, AWREADY should eventually be asserted
    property write_address_handshake;
        @(posedge clk) disable iff (!resetn)
        axi_awvalid |-> ##[1:$] axi_awready;
    endproperty
    assert property (write_address_handshake);

    // Assertion: Write Data Handshake
    // When WVALID is asserted, WREADY should eventually be asserted
    property write_data_handshake;
        @(posedge clk) disable iff (!resetn)
        axi_wvalid |-> ##[1:$] axi_wready;
    endproperty
    assert property (write_data_handshake);

    // Assertion: Write Response
    // When AWREADY, AWVALID, WREADY, and WVALID are asserted, BVALID should be asserted eventually
    property write_response;
        @(posedge clk) disable iff (!resetn)
        (axi_awready && axi_awvalid && axi_wready && axi_wvalid) |-> ##[1:$] axi_bvalid;
    endproperty
    assert property (write_response);

    // Assertion: Read Address Handshake
    // When ARVALID is asserted, ARREADY should eventually be asserted
    property read_address_handshake;
        @(posedge clk) disable iff (!resetn)
        axi_arvalid |-> ##[1:$] axi_arready;
    endproperty
    assert property (read_address_handshake);

    // Assertion: Read Data Valid
    // When ARREADY and ARVALID are asserted, RVALID should be asserted eventually
    property read_data_valid;
        @(posedge clk) disable iff (!resetn)
        (axi_arready && axi_arvalid) |-> ##[1:$] axi_rvalid;
    endproperty
    assert property (read_data_valid);

    // Assertion: GPIO Output
    // When AWREADY, AWVALID, WREADY, and WVALID are asserted and address is 0, GPIO output should be updated with WDATA
    property gpio_output_update;
        @(posedge clk) disable iff (!resetn)
        (axi_awready && axi_awvalid && axi_wready && axi_wvalid && (axi_awaddr == 32'h0)) |-> ##1 (gpio_out == axi_wdata);
    endproperty
    assert property (gpio_output_update);

    // Assertion: GPIO Input
    // When ARREADY and ARVALID are asserted and address is 0, RDATA should equal GPIO input
    property gpio_input_check;
        @(posedge clk) disable iff (!resetn)
        (axi_arready && axi_arvalid && (axi_araddr == 32'h0)) |-> ##[1:$] (axi_rdata == gpio_in);
    endproperty
    assert property (gpio_input_check);

endmodule
