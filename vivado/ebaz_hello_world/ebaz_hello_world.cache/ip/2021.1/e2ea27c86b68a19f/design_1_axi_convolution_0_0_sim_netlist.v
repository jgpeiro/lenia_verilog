// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sat Jun  1 19:17:41 2024
// Host        : DESKTOP-O0A6U7N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_convolution_0_0_sim_netlist.v
// Design      : design_1_axi_convolution_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_convolution
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_BVALID,
    S_AXI_RVALID,
    S_AXI_ACLK,
    S_AXI_ARADDR,
    S_AXI_WDATA,
    S_AXI_ARESETN,
    S_AXI_AWVALID,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARVALID,
    S_AXI_RREADY);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [31:0]S_AXI_RDATA;
  output S_AXI_BVALID;
  output S_AXI_RVALID;
  input S_AXI_ACLK;
  input [6:0]S_AXI_ARADDR;
  input [31:0]S_AXI_WDATA;
  input S_AXI_ARESETN;
  input S_AXI_AWVALID;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;

  wire S_AXI_ACLK;
  wire [6:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire S_AXI_AWREADY;
  wire S_AXI_AWVALID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID;
  wire [31:0]S_AXI_WDATA;
  wire S_AXI_WREADY;
  wire S_AXI_WVALID;
  wire [6:0]axi_araddr;
  wire axi_arready0;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[31]_i_3_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [31:0]\kernel_reg[0][0]_0 ;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire p_30_in;

  FDRE \axi_araddr_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[0]),
        .Q(axi_araddr[0]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[1]),
        .Q(axi_araddr[1]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[2]),
        .Q(axi_araddr[2]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[3]),
        .Q(axi_araddr[3]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[4]),
        .Q(axi_araddr[4]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[5]),
        .Q(axi_araddr[5]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR[6]),
        .Q(axi_araddr[6]),
        .R(p_0_in));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(S_AXI_ARVALID),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(S_AXI_ARESETN),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_2
       (.I0(S_AXI_AWVALID),
        .I1(S_AXI_WVALID),
        .I2(S_AXI_AWREADY),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(S_AXI_AWREADY),
        .I1(S_AXI_AWVALID),
        .I2(S_AXI_WVALID),
        .I3(S_AXI_WREADY),
        .I4(S_AXI_BREADY),
        .I5(S_AXI_BVALID),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(S_AXI_BVALID),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [0]),
        .O(p_1_in[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[10]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [10]),
        .O(p_1_in[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[11]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [11]),
        .O(p_1_in[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[12]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [12]),
        .O(p_1_in[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[13]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [13]),
        .O(p_1_in[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[14]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [14]),
        .O(p_1_in[14]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[15]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [15]),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[16]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [16]),
        .O(p_1_in[16]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[17]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [17]),
        .O(p_1_in[17]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[18]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [18]),
        .O(p_1_in[18]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[19]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [19]),
        .O(p_1_in[19]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [1]),
        .O(p_1_in[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[20]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [20]),
        .O(p_1_in[20]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[21]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [21]),
        .O(p_1_in[21]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[22]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [22]),
        .O(p_1_in[22]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[23]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [23]),
        .O(p_1_in[23]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[24]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [24]),
        .O(p_1_in[24]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[25]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [25]),
        .O(p_1_in[25]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[26]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [26]),
        .O(p_1_in[26]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[27]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [27]),
        .O(p_1_in[27]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[28]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [28]),
        .O(p_1_in[28]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[29]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [29]),
        .O(p_1_in[29]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [2]),
        .O(p_1_in[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[30]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [30]),
        .O(p_1_in[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_rdata[31]_i_1 
       (.I0(S_AXI_ARVALID),
        .I1(S_AXI_ARREADY),
        .O(p_30_in));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[31]_i_2 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [31]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h0001)) 
    \axi_rdata[31]_i_3 
       (.I0(axi_araddr[5]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .O(\axi_rdata[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[3]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [3]),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[4]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [4]),
        .O(p_1_in[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [5]),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[6]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [6]),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[7]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [7]),
        .O(p_1_in[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[8]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [8]),
        .O(p_1_in[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \axi_rdata[9]_i_1 
       (.I0(\axi_rdata[31]_i_3_n_0 ),
        .I1(axi_araddr[1]),
        .I2(axi_araddr[0]),
        .I3(axi_araddr[6]),
        .I4(\kernel_reg[0][0]_0 [9]),
        .O(p_1_in[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[0]),
        .Q(S_AXI_RDATA[0]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[10]),
        .Q(S_AXI_RDATA[10]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[11]),
        .Q(S_AXI_RDATA[11]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[12]),
        .Q(S_AXI_RDATA[12]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[13]),
        .Q(S_AXI_RDATA[13]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[14]),
        .Q(S_AXI_RDATA[14]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[15]),
        .Q(S_AXI_RDATA[15]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[16]),
        .Q(S_AXI_RDATA[16]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[17]),
        .Q(S_AXI_RDATA[17]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[18]),
        .Q(S_AXI_RDATA[18]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[19]),
        .Q(S_AXI_RDATA[19]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[1]),
        .Q(S_AXI_RDATA[1]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[20]),
        .Q(S_AXI_RDATA[20]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[21]),
        .Q(S_AXI_RDATA[21]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[22]),
        .Q(S_AXI_RDATA[22]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[23]),
        .Q(S_AXI_RDATA[23]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[24]),
        .Q(S_AXI_RDATA[24]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[25]),
        .Q(S_AXI_RDATA[25]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[26]),
        .Q(S_AXI_RDATA[26]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[27]),
        .Q(S_AXI_RDATA[27]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[28]),
        .Q(S_AXI_RDATA[28]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[29]),
        .Q(S_AXI_RDATA[29]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[2]),
        .Q(S_AXI_RDATA[2]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[30]),
        .Q(S_AXI_RDATA[30]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[31]),
        .Q(S_AXI_RDATA[31]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[3]),
        .Q(S_AXI_RDATA[3]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[4]),
        .Q(S_AXI_RDATA[4]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[5]),
        .Q(S_AXI_RDATA[5]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[6]),
        .Q(S_AXI_RDATA[6]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[7]),
        .Q(S_AXI_RDATA[7]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[8]),
        .Q(S_AXI_RDATA[8]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(p_30_in),
        .D(p_1_in[9]),
        .Q(S_AXI_RDATA[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARVALID),
        .I1(S_AXI_ARREADY),
        .I2(S_AXI_RVALID),
        .I3(S_AXI_RREADY),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(S_AXI_RVALID),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(S_AXI_AWVALID),
        .I1(S_AXI_WVALID),
        .I2(S_AXI_WREADY),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[0]),
        .Q(\kernel_reg[0][0]_0 [0]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][10] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[10]),
        .Q(\kernel_reg[0][0]_0 [10]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][11] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[11]),
        .Q(\kernel_reg[0][0]_0 [11]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][12] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[12]),
        .Q(\kernel_reg[0][0]_0 [12]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][13] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[13]),
        .Q(\kernel_reg[0][0]_0 [13]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][14] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[14]),
        .Q(\kernel_reg[0][0]_0 [14]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][15] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[15]),
        .Q(\kernel_reg[0][0]_0 [15]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][16] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[16]),
        .Q(\kernel_reg[0][0]_0 [16]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][17] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[17]),
        .Q(\kernel_reg[0][0]_0 [17]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][18] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[18]),
        .Q(\kernel_reg[0][0]_0 [18]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][19] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[19]),
        .Q(\kernel_reg[0][0]_0 [19]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[1]),
        .Q(\kernel_reg[0][0]_0 [1]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][20] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[20]),
        .Q(\kernel_reg[0][0]_0 [20]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][21] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[21]),
        .Q(\kernel_reg[0][0]_0 [21]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][22] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[22]),
        .Q(\kernel_reg[0][0]_0 [22]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][23] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[23]),
        .Q(\kernel_reg[0][0]_0 [23]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][24] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[24]),
        .Q(\kernel_reg[0][0]_0 [24]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][25] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[25]),
        .Q(\kernel_reg[0][0]_0 [25]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][26] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[26]),
        .Q(\kernel_reg[0][0]_0 [26]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][27] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[27]),
        .Q(\kernel_reg[0][0]_0 [27]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][28] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[28]),
        .Q(\kernel_reg[0][0]_0 [28]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][29] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[29]),
        .Q(\kernel_reg[0][0]_0 [29]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[2]),
        .Q(\kernel_reg[0][0]_0 [2]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][30] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[30]),
        .Q(\kernel_reg[0][0]_0 [30]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][31] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[31]),
        .Q(\kernel_reg[0][0]_0 [31]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[3]),
        .Q(\kernel_reg[0][0]_0 [3]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][4] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[4]),
        .Q(\kernel_reg[0][0]_0 [4]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][5] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[5]),
        .Q(\kernel_reg[0][0]_0 [5]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][6] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[6]),
        .Q(\kernel_reg[0][0]_0 [6]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][7] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[7]),
        .Q(\kernel_reg[0][0]_0 [7]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][8] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[8]),
        .Q(\kernel_reg[0][0]_0 [8]),
        .R(p_0_in));
  FDRE \kernel_reg[0][0][9] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[9]),
        .Q(\kernel_reg[0][0]_0 [9]),
        .R(p_0_in));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axi_convolution_0_0,axi_convolution,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axi_convolution,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input S_AXI_ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input S_AXI_ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [6:0]S_AXI_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [6:0]S_AXI_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input S_AXI_RREADY;

  wire \<const0> ;
  wire S_AXI_ACLK;
  wire [6:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire S_AXI_AWREADY;
  wire S_AXI_AWVALID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID;
  wire [31:0]S_AXI_WDATA;
  wire S_AXI_WREADY;
  wire S_AXI_WVALID;

  assign S_AXI_BRESP[1] = \<const0> ;
  assign S_AXI_BRESP[0] = \<const0> ;
  assign S_AXI_RRESP[1] = \<const0> ;
  assign S_AXI_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_convolution inst
       (.S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARADDR(S_AXI_ARADDR),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RREADY(S_AXI_RREADY),
        .S_AXI_RVALID(S_AXI_RVALID),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WREADY(S_AXI_WREADY),
        .S_AXI_WVALID(S_AXI_WVALID));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
