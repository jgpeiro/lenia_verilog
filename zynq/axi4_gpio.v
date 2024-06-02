/*module axi4_gpio (
    input wire         clk,
    input wire         resetn,
    // AXI4-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    output reg         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    output reg         axi_wready,
    output reg [1:0]   axi_bresp,
    output reg         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    output reg         axi_arready,
    output reg [31:0]  axi_rdata,
    output reg [1:0]   axi_rresp,
    output reg         axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    output reg [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);

    // AXI4-Lite states
    localparam IDLE  = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ  = 2'b10;

    reg [1:0] state;

    always @(posedge clk) begin
        if (!resetn) begin
            state       <= IDLE;
            axi_awready <= 0;
            axi_wready  <= 0;
            axi_bvalid  <= 0;
            axi_arready <= 0;
            axi_rvalid  <= 0;
            gpio_out    <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (axi_awvalid && axi_wvalid) begin
                        axi_awready <= 1;
                        axi_wready  <= 1;
                        state       <= WRITE;
                    end else if (axi_arvalid) begin
                        axi_arready <= 1;
                        state       <= READ;
                    end
                end

                WRITE: begin
                    if (axi_awready && axi_wready && axi_awvalid && axi_wvalid) begin
                        if (axi_awaddr == 32'h0) begin
                            gpio_out <= axi_wdata;
                        end
                        axi_awready <= 0;
                        axi_wready  <= 0;
                        axi_bvalid  <= 1;
                        axi_bresp   <= 2'b00; // OKAY response
                        state       <= IDLE;
                    end
                end

                READ: begin
                    if (axi_arready && axi_arvalid) begin
                        if (axi_araddr == 32'h0) begin
                            axi_rdata <= gpio_in;
                        end else begin
                            axi_rdata <= 32'h0;
                        end
                        axi_arready <= 0;
                        axi_rvalid  <= 1;
                        axi_rresp   <= 2'b00; // OKAY response
                        state       <= IDLE;
                    end
                end
            endcase

            if (axi_bvalid && axi_bready) begin
                axi_bvalid <= 0;
            end

            if (axi_rvalid && axi_rready) begin
                axi_rvalid <= 0;
            end
        end
    end
endmodule
*/

/*
module axi4_gpio (
    input wire         clk,
    input wire         resetn,
    // AXI4-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    output reg         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    output reg         axi_wready,
    output reg [1:0]   axi_bresp,
    output reg         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    output reg         axi_arready,
    output reg [31:0]  axi_rdata,
    output reg [1:0]   axi_rresp,
    output reg         axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    output reg [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);

    // AXI4-Lite states
    localparam IDLE  = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ  = 2'b10;

    reg [1:0] state;

    // Write Address and Data Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_awready <= 0;
            axi_wready  <= 0;
        end else begin
            if (axi_awvalid && axi_wvalid && (state == IDLE)) begin
                axi_awready <= 1;
                axi_wready  <= 1;
                
            end else begin
                axi_awready <= 0;
                axi_wready  <= 0;
            end
        end
    end

    // Write Response Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_bvalid <= 0;
            axi_bresp  <= 2'b00;
        end else begin
            if (axi_awready && axi_awvalid && axi_wready && axi_wvalid) begin
                if (axi_awaddr == 32'h0) begin
                    gpio_out <= axi_wdata;
                end
                axi_bvalid <= 1;
                axi_bresp  <= 2'b00; // OKAY response
            end else if (axi_bvalid && axi_bready) begin
                axi_bvalid <= 0;
            end
        end
    end

    // Read Address Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_arready <= 0;
        end else begin
            if (axi_arvalid && (state == IDLE)) begin
                axi_arready <= 1;
            end else begin
                axi_arready <= 0;
            end
        end
    end

    // Read Data Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_rvalid <= 0;
            axi_rresp  <= 2'b00;
            axi_rdata  <= 32'h0;
        end else begin
            if (axi_arready && axi_arvalid) begin
                if (axi_araddr == 32'h0) begin
                    axi_rdata <= gpio_in;
                end else begin
                    axi_rdata <= 32'h0;
                end
                axi_rvalid <= 1;
                axi_rresp  <= 2'b00; // OKAY response
            end else if (axi_rvalid && axi_rready) begin
                axi_rvalid <= 0;
            end
        end
    end

    // State Machine Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (axi_awvalid && axi_wvalid) begin
                        state <= WRITE;
                    end else if (axi_arvalid) begin
                        state <= READ;
                    end
                end
                WRITE: begin
                    if (axi_awready && axi_wready && axi_awvalid && axi_wvalid) begin
                        state <= IDLE;
                    end
                end
                READ: begin
                    if (axi_arready && axi_arvalid) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
*/

/*
module axi4_gpio (
    input wire         clk,
    input wire         resetn,
    // AXI4-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    output reg         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    output reg         axi_wready,
    output reg [1:0]   axi_bresp,
    output reg         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    output reg         axi_arready,
    output reg [31:0]  axi_rdata,
    output reg [1:0]   axi_rresp,
    output reg         axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    output reg [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);

    // AXI4-Lite states
    localparam IDLE  = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ  = 2'b10;

    reg [1:0] state;

    // Write Address and Data Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_awready <= 0;
            axi_wready  <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    axi_awready <= axi_awvalid;
                    axi_wready  <= axi_wvalid;
                    if (axi_awvalid && axi_wvalid) begin
                        state <= WRITE;
                    end else if (axi_arvalid) begin
                        axi_arready <= 1;
                        state <= READ;
                    end
                end
                WRITE: begin
                    axi_awready <= 0;
                    axi_wready  <= 0;
                    if (axi_bvalid && axi_bready) begin
                        state <= IDLE;
                    end
                end
                READ: begin
                    axi_arready <= 0;
                    if (axi_rvalid && axi_rready) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

    // Write Response Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_bvalid <= 0;
            axi_bresp  <= 2'b00;
            gpio_out <= 32'b0;
        end else begin
            if (axi_awready && axi_awvalid && axi_wready && axi_wvalid) begin
                if (axi_awaddr == 32'h0) begin
                    gpio_out <= axi_wdata;
                end
                axi_bvalid <= 1;
                axi_bresp  <= 2'b00; // OKAY response
            end else if (axi_bvalid && axi_bready) begin
                axi_bvalid <= 0;
            end
        end
    end

    // Read Data Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_rvalid <= 0;
            axi_rresp  <= 2'b00;
            axi_rdata  <= 32'h0;
        end else begin
            if (axi_arready && axi_arvalid) begin
                if (axi_araddr == 32'h0) begin
                    axi_rdata <= gpio_in;
                end else begin
                    axi_rdata <= 32'h0;
                end
                axi_rvalid <= 1;
                axi_rresp  <= 2'b00; // OKAY response
            end else if (axi_rvalid && axi_rready) begin
                axi_rvalid <= 0;
            end
        end
    end
endmodule

*/
/*
module axi4_gpio (
    input wire         clk,
    input wire         resetn,
    // AXI4-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    output reg         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    output reg         axi_wready,
    output reg [1:0]   axi_bresp,
    output reg         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    output reg         axi_arready,
    output reg [31:0]  axi_rdata,
    output reg [1:0]   axi_rresp,
    output reg         axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    output reg [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);

    // AXI4-Lite states
    localparam IDLE  = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ  = 2'b10;

    reg [1:0] state;

    // Write Address and Data Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_awready <= 0;
            axi_wready  <= 0;
        end else begin
            if (axi_awvalid && axi_wvalid && (state == IDLE)) begin
                axi_awready <= 1;
                axi_wready  <= 1;
            end else if (state == WRITE) begin
                axi_awready <= 0;
                axi_wready  <= 0;
            end
        end
    end

    // Write Response Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_bvalid <= 0;
            axi_bresp  <= 2'b00;
            gpio_out   <= 32'b0;
        end else begin
            if (axi_awready && axi_awvalid && axi_wready && axi_wvalid) begin
                if (axi_awaddr == 32'h0) begin
                    // Apply write strobe (axi_wstrb) to selectively update gpio_out
                    if (axi_wstrb[0]) gpio_out[7:0]   <= axi_wdata[7:0];
                    if (axi_wstrb[1]) gpio_out[15:8]  <= axi_wdata[15:8];
                    if (axi_wstrb[2]) gpio_out[23:16] <= axi_wdata[23:16];
                    if (axi_wstrb[3]) gpio_out[31:24] <= axi_wdata[31:24];
                end
                axi_bvalid <= 1;
                axi_bresp  <= 2'b00; // OKAY response
            end else if (axi_bvalid && axi_bready) begin
                axi_bvalid <= 0;
            end
        end
    end

    // Read Address Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_arready <= 0;
        end else begin
            if (axi_arvalid && (state == IDLE)) begin
                axi_arready <= 1;
            end else if (state == READ) begin
                axi_arready <= 0;
            end
        end
    end

    // Read Data Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_rvalid <= 0;
            axi_rresp  <= 2'b00;
            axi_rdata  <= 32'h0;
        end else begin
            if (axi_arready && axi_arvalid) begin
                if (axi_araddr == 32'h0) begin
                    axi_rdata <= gpio_in;
                end else begin
                    axi_rdata <= 32'h0;
                end
                axi_rvalid <= 1;
                axi_rresp  <= 2'b00; // OKAY response
            end else if (axi_rvalid && axi_rready) begin
                axi_rvalid <= 0;
            end
        end
    end

    // State Machine Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (axi_awvalid && axi_wvalid) begin
                        state <= WRITE;
                    end else if (axi_arvalid) begin
                        state <= READ;
                    end
                end
                WRITE: begin
                    if (axi_bvalid && axi_bready) begin
                        state <= IDLE;
                    end
                end
                READ: begin
                    if (axi_rvalid && axi_rready) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule

*/
/*
module axi_gpio (
    input wire         clk,
    input wire         resetn,
    // AXI-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    output             axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    output             axi_wready,
    output     [1:0]   axi_bresp,
    output             axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    output             axi_arready,
    output     [31:0]  axi_rdata,
    output     [1:0]   axi_rresp,
    output             axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    output     [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);
    // States
    localparam IDLE  = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ  = 2'b10;

    // ...
    
    reg [1:0] state;

    // Write Address and Data Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            //...
        end else begin
            //...
        end
    end
    
    // Write Address and Data Handshake Process
    //...
    
    // Write Response Process
    //...
    
    // Read Address Handshake Process
    //...
    
    // Read Data Process
    //...
    
    // State Machine Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                end
                WRITE: begin
                end
                READ: begin
                end
            endcase
        end
    end
endmodule



    // Write Address and Data Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_awready <= 0;
            axi_wready  <= 0;
        end else begin
            if (axi_awvalid && axi_wvalid && (state == IDLE)) begin
                axi_awready <= 1;
                axi_wready  <= 1;
            end else if (state == WRITE) begin
                axi_awready <= 0;
                axi_wready  <= 0;
            end
        end
    end

    // Write Response Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_bvalid <= 0;
            axi_bresp  <= 2'b00;
            gpio_out   <= 32'b0;
        end else begin
            if (axi_awready && axi_awvalid && axi_wready && axi_wvalid) begin
                if (axi_awaddr == 32'h0) begin
                    // Apply write strobe (axi_wstrb) to selectively update gpio_out
                    if (axi_wstrb[0]) gpio_out[7:0]   <= axi_wdata[7:0];
                    if (axi_wstrb[1]) gpio_out[15:8]  <= axi_wdata[15:8];
                    if (axi_wstrb[2]) gpio_out[23:16] <= axi_wdata[23:16];
                    if (axi_wstrb[3]) gpio_out[31:24] <= axi_wdata[31:24];
                end
                axi_bvalid <= 1;
                axi_bresp  <= 2'b00; // OKAY response
            end else if (axi_bvalid && axi_bready) begin
                axi_bvalid <= 0;
            end
        end
    end
    */
    
module axi4_gpio (
    input wire         clk,
    input wire         resetn,
    // AXI-lite interface
    input wire [31:0]  axi_awaddr,
    input wire         axi_awvalid,
    output reg         axi_awready,
    input wire [31:0]  axi_wdata,
    input wire [3:0]   axi_wstrb,
    input wire         axi_wvalid,
    output reg         axi_wready,
    output reg [1:0]   axi_bresp,
    output reg         axi_bvalid,
    input wire         axi_bready,
    input wire [31:0]  axi_araddr,
    input wire         axi_arvalid,
    output reg         axi_arready,
    output reg [31:0]  axi_rdata,
    output reg [1:0]   axi_rresp,
    output reg         axi_rvalid,
    input wire         axi_rready,
    // GPIO interface
    output reg [31:0]  gpio_out,
    input wire [31:0]  gpio_in
);
    // States
    localparam IDLE  = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ  = 2'b10;

    reg [1:0] state;
    reg [31:0] reg_data;

    // Write Address and Data Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_awready <= 0;
            axi_wready <= 0;
            axi_bvalid <= 0;
            axi_bresp <= 2'b00;
            gpio_out <= 32'h0;
        end else begin
            if (axi_awvalid && !axi_awready) begin
                $display( "axi_awaddr = %h", axi_awaddr );
                axi_awready <= 1;
            end else begin
                axi_awready <= 0;
            end

            if (axi_wvalid && !axi_wready) begin
                $display( "axi_wdata = %h", axi_wdata );
                axi_wready <= 1;
            end else begin
                axi_wready <= 0;
            end

            if (axi_awready && axi_awvalid && axi_wready && axi_wvalid) begin
                gpio_out <= axi_wdata;
                axi_bvalid <= 1;
                axi_bresp <= 2'b00; // OKAY response
            end

            if (axi_bvalid && axi_bready) begin
                axi_bvalid <= 0;
            end
        end
    end
    
    // Read Address Handshake Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            axi_arready <= 0;
            axi_rvalid <= 0;
            axi_rresp <= 2'b00;
            axi_rdata <= 32'h0;
        end else begin
            if (axi_arvalid && !axi_arready) begin
                axi_arready <= 1;
            end else begin
                axi_arready <= 0;
            end

            if (axi_arready && axi_arvalid) begin
                axi_rdata <= gpio_in;
                axi_rvalid <= 1;
                axi_rresp <= 2'b00; // OKAY response
            end

            if (axi_rvalid && axi_rready) begin
                axi_rvalid <= 0;
            end
        end
    end

    // State Machine Process
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (axi_awvalid && axi_wvalid) begin
                        state <= WRITE;
                    end else if (axi_arvalid) begin
                        state <= READ;
                    end
                end
                WRITE: begin
                    if (axi_bvalid && axi_bready) begin
                        state <= IDLE;
                    end
                end
                READ: begin
                    if (axi_rvalid && axi_rready) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
