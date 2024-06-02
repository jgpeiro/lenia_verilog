// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue May 28 22:47:50 2024
// Host        : DESKTOP-O0A6U7N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_pwm_0_0_sim_netlist.v
// Design      : design_1_axi_pwm_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_pwm
   (s_axi_awready,
    s_axi_wready,
    s_axi_arready,
    s_axi_rdata,
    pwm_out,
    s_axi_bvalid,
    s_axi_rvalid,
    clk,
    s_axi_wdata,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_awaddr,
    s_axi_arvalid,
    s_axi_araddr,
    resetn,
    s_axi_bready,
    s_axi_rready);
  output s_axi_awready;
  output s_axi_wready;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output pwm_out;
  output s_axi_bvalid;
  output s_axi_rvalid;
  input clk;
  input [31:0]s_axi_wdata;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input [31:0]s_axi_awaddr;
  input s_axi_arvalid;
  input [31:0]s_axi_araddr;
  input resetn;
  input s_axi_bready;
  input s_axi_rready;

  wire arready_reg0;
  wire awready_reg0;
  wire bvalid_reg_i_1_n_0;
  wire clear;
  wire clk;
  wire \counter[0]_i_2_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_i_1_n_0 ;
  wire \counter_reg[0]_i_1_n_1 ;
  wire \counter_reg[0]_i_1_n_2 ;
  wire \counter_reg[0]_i_1_n_3 ;
  wire \counter_reg[0]_i_1_n_4 ;
  wire \counter_reg[0]_i_1_n_5 ;
  wire \counter_reg[0]_i_1_n_6 ;
  wire \counter_reg[0]_i_1_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_1 ;
  wire \counter_reg[28]_i_1_n_2 ;
  wire \counter_reg[28]_i_1_n_3 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire [31:0]duty_cycle_reg;
  wire \duty_cycle_reg[31]_i_1_n_0 ;
  wire \duty_cycle_reg[31]_i_2_n_0 ;
  wire \duty_cycle_reg[31]_i_3_n_0 ;
  wire \duty_cycle_reg[31]_i_4_n_0 ;
  wire \duty_cycle_reg[31]_i_5_n_0 ;
  wire \duty_cycle_reg[31]_i_6_n_0 ;
  wire \duty_cycle_reg[31]_i_7_n_0 ;
  wire pwm_out;
  wire pwm_out_carry__0_i_1_n_0;
  wire pwm_out_carry__0_i_2_n_0;
  wire pwm_out_carry__0_i_3_n_0;
  wire pwm_out_carry__0_i_4_n_0;
  wire pwm_out_carry__0_i_5_n_0;
  wire pwm_out_carry__0_i_6_n_0;
  wire pwm_out_carry__0_i_7_n_0;
  wire pwm_out_carry__0_i_8_n_0;
  wire pwm_out_carry__0_n_0;
  wire pwm_out_carry__0_n_1;
  wire pwm_out_carry__0_n_2;
  wire pwm_out_carry__0_n_3;
  wire pwm_out_carry__1_i_1_n_0;
  wire pwm_out_carry__1_i_2_n_0;
  wire pwm_out_carry__1_i_3_n_0;
  wire pwm_out_carry__1_i_4_n_0;
  wire pwm_out_carry__1_i_5_n_0;
  wire pwm_out_carry__1_i_6_n_0;
  wire pwm_out_carry__1_i_7_n_0;
  wire pwm_out_carry__1_i_8_n_0;
  wire pwm_out_carry__1_n_0;
  wire pwm_out_carry__1_n_1;
  wire pwm_out_carry__1_n_2;
  wire pwm_out_carry__1_n_3;
  wire pwm_out_carry__2_i_1_n_0;
  wire pwm_out_carry__2_i_2_n_0;
  wire pwm_out_carry__2_i_3_n_0;
  wire pwm_out_carry__2_i_4_n_0;
  wire pwm_out_carry__2_i_5_n_0;
  wire pwm_out_carry__2_i_6_n_0;
  wire pwm_out_carry__2_i_7_n_0;
  wire pwm_out_carry__2_i_8_n_0;
  wire pwm_out_carry__2_n_1;
  wire pwm_out_carry__2_n_2;
  wire pwm_out_carry__2_n_3;
  wire pwm_out_carry_i_1_n_0;
  wire pwm_out_carry_i_2_n_0;
  wire pwm_out_carry_i_3_n_0;
  wire pwm_out_carry_i_4_n_0;
  wire pwm_out_carry_i_5_n_0;
  wire pwm_out_carry_i_6_n_0;
  wire pwm_out_carry_i_7_n_0;
  wire pwm_out_carry_i_8_n_0;
  wire pwm_out_carry_n_0;
  wire pwm_out_carry_n_1;
  wire pwm_out_carry_n_2;
  wire pwm_out_carry_n_3;
  wire \rdata_reg[31]_i_1_n_0 ;
  wire \rdata_reg[31]_i_2_n_0 ;
  wire \rdata_reg[31]_i_3_n_0 ;
  wire \rdata_reg[31]_i_4_n_0 ;
  wire \rdata_reg[31]_i_5_n_0 ;
  wire \rdata_reg[31]_i_6_n_0 ;
  wire \rdata_reg[31]_i_7_n_0 ;
  wire resetn;
  wire rvalid_reg_i_1_n_0;
  wire [31:0]s_axi_araddr;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire wready_reg0;
  wire [3:3]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_pwm_out_carry_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_pwm_out_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    arready_reg_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_arready),
        .O(arready_reg0));
  FDRE arready_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(arready_reg0),
        .Q(s_axi_arready),
        .R(clear));
  LUT1 #(
    .INIT(2'h1)) 
    awready_reg_i_1
       (.I0(resetn),
        .O(clear));
  LUT2 #(
    .INIT(4'h2)) 
    awready_reg_i_2
       (.I0(s_axi_awvalid),
        .I1(s_axi_awready),
        .O(awready_reg0));
  FDRE awready_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(awready_reg0),
        .Q(s_axi_awready),
        .R(clear));
  LUT6 #(
    .INIT(64'hF222222222222222)) 
    bvalid_reg_i_1
       (.I0(s_axi_bvalid),
        .I1(s_axi_bready),
        .I2(s_axi_awvalid),
        .I3(s_axi_awready),
        .I4(s_axi_wvalid),
        .I5(s_axi_wready),
        .O(bvalid_reg_i_1_n_0));
  FDRE bvalid_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(bvalid_reg_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(clear));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_2 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_2_n_0 ));
  FDRE \counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_7 ),
        .Q(counter_reg[0]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_1_n_0 ,\counter_reg[0]_i_1_n_1 ,\counter_reg[0]_i_1_n_2 ,\counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_1_n_4 ,\counter_reg[0]_i_1_n_5 ,\counter_reg[0]_i_1_n_6 ,\counter_reg[0]_i_1_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_2_n_0 }));
  FDRE \counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(clear));
  FDRE \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(clear));
  FDRE \counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE \counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(clear));
  FDRE \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(clear));
  FDRE \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(clear));
  FDRE \counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE \counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(clear));
  FDRE \counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(clear));
  FDRE \counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(clear));
  FDRE \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_6 ),
        .Q(counter_reg[1]),
        .R(clear));
  FDRE \counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(clear));
  FDRE \counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(clear));
  FDRE \counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(clear));
  FDRE \counter_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE \counter_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(clear));
  FDRE \counter_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(clear));
  FDRE \counter_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(clear));
  FDRE \counter_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3],\counter_reg[28]_i_1_n_1 ,\counter_reg[28]_i_1_n_2 ,\counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(counter_reg[31:28]));
  FDRE \counter_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(clear));
  FDRE \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_5 ),
        .Q(counter_reg[2]),
        .R(clear));
  FDRE \counter_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(clear));
  FDRE \counter_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(clear));
  FDRE \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_4 ),
        .Q(counter_reg[3]),
        .R(clear));
  FDRE \counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_1_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE \counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(clear));
  FDRE \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(clear));
  FDRE \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(clear));
  FDRE \counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE \counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \duty_cycle_reg[31]_i_1 
       (.I0(\duty_cycle_reg[31]_i_2_n_0 ),
        .I1(\duty_cycle_reg[31]_i_3_n_0 ),
        .I2(\duty_cycle_reg[31]_i_4_n_0 ),
        .I3(\duty_cycle_reg[31]_i_5_n_0 ),
        .I4(\duty_cycle_reg[31]_i_6_n_0 ),
        .I5(\duty_cycle_reg[31]_i_7_n_0 ),
        .O(\duty_cycle_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \duty_cycle_reg[31]_i_2 
       (.I0(s_axi_wvalid),
        .I1(s_axi_wready),
        .I2(s_axi_awaddr[30]),
        .I3(s_axi_awaddr[31]),
        .I4(s_axi_awready),
        .I5(s_axi_awvalid),
        .O(\duty_cycle_reg[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \duty_cycle_reg[31]_i_3 
       (.I0(s_axi_awaddr[20]),
        .I1(s_axi_awaddr[21]),
        .I2(s_axi_awaddr[18]),
        .I3(s_axi_awaddr[19]),
        .I4(s_axi_awaddr[23]),
        .I5(s_axi_awaddr[22]),
        .O(\duty_cycle_reg[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \duty_cycle_reg[31]_i_4 
       (.I0(s_axi_awaddr[2]),
        .I1(s_axi_awaddr[3]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(s_axi_awaddr[5]),
        .I5(s_axi_awaddr[4]),
        .O(\duty_cycle_reg[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \duty_cycle_reg[31]_i_5 
       (.I0(s_axi_awaddr[26]),
        .I1(s_axi_awaddr[27]),
        .I2(s_axi_awaddr[24]),
        .I3(s_axi_awaddr[25]),
        .I4(s_axi_awaddr[29]),
        .I5(s_axi_awaddr[28]),
        .O(\duty_cycle_reg[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \duty_cycle_reg[31]_i_6 
       (.I0(s_axi_awaddr[8]),
        .I1(s_axi_awaddr[9]),
        .I2(s_axi_awaddr[6]),
        .I3(s_axi_awaddr[7]),
        .I4(s_axi_awaddr[11]),
        .I5(s_axi_awaddr[10]),
        .O(\duty_cycle_reg[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \duty_cycle_reg[31]_i_7 
       (.I0(s_axi_awaddr[14]),
        .I1(s_axi_awaddr[15]),
        .I2(s_axi_awaddr[12]),
        .I3(s_axi_awaddr[13]),
        .I4(s_axi_awaddr[17]),
        .I5(s_axi_awaddr[16]),
        .O(\duty_cycle_reg[31]_i_7_n_0 ));
  FDRE \duty_cycle_reg_reg[0] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[0]),
        .Q(duty_cycle_reg[0]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[10] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[10]),
        .Q(duty_cycle_reg[10]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[11] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[11]),
        .Q(duty_cycle_reg[11]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[12] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[12]),
        .Q(duty_cycle_reg[12]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[13] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[13]),
        .Q(duty_cycle_reg[13]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[14] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[14]),
        .Q(duty_cycle_reg[14]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[15] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[15]),
        .Q(duty_cycle_reg[15]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[16] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[16]),
        .Q(duty_cycle_reg[16]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[17] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[17]),
        .Q(duty_cycle_reg[17]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[18] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[18]),
        .Q(duty_cycle_reg[18]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[19] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[19]),
        .Q(duty_cycle_reg[19]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[1] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[1]),
        .Q(duty_cycle_reg[1]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[20] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[20]),
        .Q(duty_cycle_reg[20]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[21] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[21]),
        .Q(duty_cycle_reg[21]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[22] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[22]),
        .Q(duty_cycle_reg[22]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[23] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[23]),
        .Q(duty_cycle_reg[23]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[24] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[24]),
        .Q(duty_cycle_reg[24]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[25] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[25]),
        .Q(duty_cycle_reg[25]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[26] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[26]),
        .Q(duty_cycle_reg[26]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[27] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[27]),
        .Q(duty_cycle_reg[27]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[28] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[28]),
        .Q(duty_cycle_reg[28]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[29] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[29]),
        .Q(duty_cycle_reg[29]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[2] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[2]),
        .Q(duty_cycle_reg[2]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[30] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[30]),
        .Q(duty_cycle_reg[30]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[31] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[31]),
        .Q(duty_cycle_reg[31]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[3] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[3]),
        .Q(duty_cycle_reg[3]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[4] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[4]),
        .Q(duty_cycle_reg[4]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[5] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[5]),
        .Q(duty_cycle_reg[5]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[6] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[6]),
        .Q(duty_cycle_reg[6]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[7] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[7]),
        .Q(duty_cycle_reg[7]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[8] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[8]),
        .Q(duty_cycle_reg[8]),
        .R(clear));
  FDRE \duty_cycle_reg_reg[9] 
       (.C(clk),
        .CE(\duty_cycle_reg[31]_i_1_n_0 ),
        .D(s_axi_wdata[9]),
        .Q(duty_cycle_reg[9]),
        .R(clear));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out_carry
       (.CI(1'b0),
        .CO({pwm_out_carry_n_0,pwm_out_carry_n_1,pwm_out_carry_n_2,pwm_out_carry_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out_carry_i_1_n_0,pwm_out_carry_i_2_n_0,pwm_out_carry_i_3_n_0,pwm_out_carry_i_4_n_0}),
        .O(NLW_pwm_out_carry_O_UNCONNECTED[3:0]),
        .S({pwm_out_carry_i_5_n_0,pwm_out_carry_i_6_n_0,pwm_out_carry_i_7_n_0,pwm_out_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out_carry__0
       (.CI(pwm_out_carry_n_0),
        .CO({pwm_out_carry__0_n_0,pwm_out_carry__0_n_1,pwm_out_carry__0_n_2,pwm_out_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out_carry__0_i_1_n_0,pwm_out_carry__0_i_2_n_0,pwm_out_carry__0_i_3_n_0,pwm_out_carry__0_i_4_n_0}),
        .O(NLW_pwm_out_carry__0_O_UNCONNECTED[3:0]),
        .S({pwm_out_carry__0_i_5_n_0,pwm_out_carry__0_i_6_n_0,pwm_out_carry__0_i_7_n_0,pwm_out_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__0_i_1
       (.I0(duty_cycle_reg[14]),
        .I1(counter_reg[14]),
        .I2(counter_reg[15]),
        .I3(duty_cycle_reg[15]),
        .O(pwm_out_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__0_i_2
       (.I0(duty_cycle_reg[12]),
        .I1(counter_reg[12]),
        .I2(counter_reg[13]),
        .I3(duty_cycle_reg[13]),
        .O(pwm_out_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__0_i_3
       (.I0(duty_cycle_reg[10]),
        .I1(counter_reg[10]),
        .I2(counter_reg[11]),
        .I3(duty_cycle_reg[11]),
        .O(pwm_out_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__0_i_4
       (.I0(duty_cycle_reg[8]),
        .I1(counter_reg[8]),
        .I2(counter_reg[9]),
        .I3(duty_cycle_reg[9]),
        .O(pwm_out_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__0_i_5
       (.I0(duty_cycle_reg[14]),
        .I1(counter_reg[14]),
        .I2(duty_cycle_reg[15]),
        .I3(counter_reg[15]),
        .O(pwm_out_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__0_i_6
       (.I0(duty_cycle_reg[12]),
        .I1(counter_reg[12]),
        .I2(duty_cycle_reg[13]),
        .I3(counter_reg[13]),
        .O(pwm_out_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__0_i_7
       (.I0(duty_cycle_reg[10]),
        .I1(counter_reg[10]),
        .I2(duty_cycle_reg[11]),
        .I3(counter_reg[11]),
        .O(pwm_out_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__0_i_8
       (.I0(duty_cycle_reg[8]),
        .I1(counter_reg[8]),
        .I2(duty_cycle_reg[9]),
        .I3(counter_reg[9]),
        .O(pwm_out_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out_carry__1
       (.CI(pwm_out_carry__0_n_0),
        .CO({pwm_out_carry__1_n_0,pwm_out_carry__1_n_1,pwm_out_carry__1_n_2,pwm_out_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out_carry__1_i_1_n_0,pwm_out_carry__1_i_2_n_0,pwm_out_carry__1_i_3_n_0,pwm_out_carry__1_i_4_n_0}),
        .O(NLW_pwm_out_carry__1_O_UNCONNECTED[3:0]),
        .S({pwm_out_carry__1_i_5_n_0,pwm_out_carry__1_i_6_n_0,pwm_out_carry__1_i_7_n_0,pwm_out_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__1_i_1
       (.I0(duty_cycle_reg[22]),
        .I1(counter_reg[22]),
        .I2(counter_reg[23]),
        .I3(duty_cycle_reg[23]),
        .O(pwm_out_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__1_i_2
       (.I0(duty_cycle_reg[20]),
        .I1(counter_reg[20]),
        .I2(counter_reg[21]),
        .I3(duty_cycle_reg[21]),
        .O(pwm_out_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__1_i_3
       (.I0(duty_cycle_reg[18]),
        .I1(counter_reg[18]),
        .I2(counter_reg[19]),
        .I3(duty_cycle_reg[19]),
        .O(pwm_out_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__1_i_4
       (.I0(duty_cycle_reg[16]),
        .I1(counter_reg[16]),
        .I2(counter_reg[17]),
        .I3(duty_cycle_reg[17]),
        .O(pwm_out_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__1_i_5
       (.I0(duty_cycle_reg[22]),
        .I1(counter_reg[22]),
        .I2(duty_cycle_reg[23]),
        .I3(counter_reg[23]),
        .O(pwm_out_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__1_i_6
       (.I0(duty_cycle_reg[20]),
        .I1(counter_reg[20]),
        .I2(duty_cycle_reg[21]),
        .I3(counter_reg[21]),
        .O(pwm_out_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__1_i_7
       (.I0(duty_cycle_reg[18]),
        .I1(counter_reg[18]),
        .I2(duty_cycle_reg[19]),
        .I3(counter_reg[19]),
        .O(pwm_out_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__1_i_8
       (.I0(duty_cycle_reg[16]),
        .I1(counter_reg[16]),
        .I2(duty_cycle_reg[17]),
        .I3(counter_reg[17]),
        .O(pwm_out_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm_out_carry__2
       (.CI(pwm_out_carry__1_n_0),
        .CO({pwm_out,pwm_out_carry__2_n_1,pwm_out_carry__2_n_2,pwm_out_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({pwm_out_carry__2_i_1_n_0,pwm_out_carry__2_i_2_n_0,pwm_out_carry__2_i_3_n_0,pwm_out_carry__2_i_4_n_0}),
        .O(NLW_pwm_out_carry__2_O_UNCONNECTED[3:0]),
        .S({pwm_out_carry__2_i_5_n_0,pwm_out_carry__2_i_6_n_0,pwm_out_carry__2_i_7_n_0,pwm_out_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__2_i_1
       (.I0(duty_cycle_reg[30]),
        .I1(counter_reg[30]),
        .I2(counter_reg[31]),
        .I3(duty_cycle_reg[31]),
        .O(pwm_out_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__2_i_2
       (.I0(duty_cycle_reg[28]),
        .I1(counter_reg[28]),
        .I2(counter_reg[29]),
        .I3(duty_cycle_reg[29]),
        .O(pwm_out_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__2_i_3
       (.I0(duty_cycle_reg[26]),
        .I1(counter_reg[26]),
        .I2(counter_reg[27]),
        .I3(duty_cycle_reg[27]),
        .O(pwm_out_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry__2_i_4
       (.I0(duty_cycle_reg[24]),
        .I1(counter_reg[24]),
        .I2(counter_reg[25]),
        .I3(duty_cycle_reg[25]),
        .O(pwm_out_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__2_i_5
       (.I0(duty_cycle_reg[30]),
        .I1(counter_reg[30]),
        .I2(duty_cycle_reg[31]),
        .I3(counter_reg[31]),
        .O(pwm_out_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__2_i_6
       (.I0(duty_cycle_reg[28]),
        .I1(counter_reg[28]),
        .I2(duty_cycle_reg[29]),
        .I3(counter_reg[29]),
        .O(pwm_out_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__2_i_7
       (.I0(duty_cycle_reg[26]),
        .I1(counter_reg[26]),
        .I2(duty_cycle_reg[27]),
        .I3(counter_reg[27]),
        .O(pwm_out_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry__2_i_8
       (.I0(duty_cycle_reg[24]),
        .I1(counter_reg[24]),
        .I2(duty_cycle_reg[25]),
        .I3(counter_reg[25]),
        .O(pwm_out_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry_i_1
       (.I0(duty_cycle_reg[6]),
        .I1(counter_reg[6]),
        .I2(counter_reg[7]),
        .I3(duty_cycle_reg[7]),
        .O(pwm_out_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry_i_2
       (.I0(duty_cycle_reg[4]),
        .I1(counter_reg[4]),
        .I2(counter_reg[5]),
        .I3(duty_cycle_reg[5]),
        .O(pwm_out_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry_i_3
       (.I0(duty_cycle_reg[2]),
        .I1(counter_reg[2]),
        .I2(counter_reg[3]),
        .I3(duty_cycle_reg[3]),
        .O(pwm_out_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm_out_carry_i_4
       (.I0(duty_cycle_reg[0]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(duty_cycle_reg[1]),
        .O(pwm_out_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry_i_5
       (.I0(duty_cycle_reg[6]),
        .I1(counter_reg[6]),
        .I2(duty_cycle_reg[7]),
        .I3(counter_reg[7]),
        .O(pwm_out_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry_i_6
       (.I0(duty_cycle_reg[4]),
        .I1(counter_reg[4]),
        .I2(duty_cycle_reg[5]),
        .I3(counter_reg[5]),
        .O(pwm_out_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry_i_7
       (.I0(duty_cycle_reg[2]),
        .I1(counter_reg[2]),
        .I2(duty_cycle_reg[3]),
        .I3(counter_reg[3]),
        .O(pwm_out_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm_out_carry_i_8
       (.I0(duty_cycle_reg[0]),
        .I1(counter_reg[0]),
        .I2(duty_cycle_reg[1]),
        .I3(counter_reg[1]),
        .O(pwm_out_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \rdata_reg[31]_i_1 
       (.I0(\rdata_reg[31]_i_2_n_0 ),
        .I1(\rdata_reg[31]_i_3_n_0 ),
        .I2(\rdata_reg[31]_i_4_n_0 ),
        .I3(\rdata_reg[31]_i_5_n_0 ),
        .I4(\rdata_reg[31]_i_6_n_0 ),
        .I5(\rdata_reg[31]_i_7_n_0 ),
        .O(\rdata_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rdata_reg[31]_i_2 
       (.I0(s_axi_araddr[24]),
        .I1(s_axi_araddr[25]),
        .I2(s_axi_araddr[22]),
        .I3(s_axi_araddr[23]),
        .I4(s_axi_araddr[27]),
        .I5(s_axi_araddr[26]),
        .O(\rdata_reg[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \rdata_reg[31]_i_3 
       (.I0(s_axi_araddr[30]),
        .I1(s_axi_araddr[31]),
        .I2(s_axi_araddr[28]),
        .I3(s_axi_araddr[29]),
        .I4(s_axi_arready),
        .I5(s_axi_arvalid),
        .O(\rdata_reg[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rdata_reg[31]_i_4 
       (.I0(s_axi_araddr[18]),
        .I1(s_axi_araddr[19]),
        .I2(s_axi_araddr[16]),
        .I3(s_axi_araddr[17]),
        .I4(s_axi_araddr[21]),
        .I5(s_axi_araddr[20]),
        .O(\rdata_reg[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rdata_reg[31]_i_5 
       (.I0(s_axi_araddr[12]),
        .I1(s_axi_araddr[13]),
        .I2(s_axi_araddr[10]),
        .I3(s_axi_araddr[11]),
        .I4(s_axi_araddr[15]),
        .I5(s_axi_araddr[14]),
        .O(\rdata_reg[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \rdata_reg[31]_i_6 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .O(\rdata_reg[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rdata_reg[31]_i_7 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_araddr[7]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[9]),
        .I5(s_axi_araddr[8]),
        .O(\rdata_reg[31]_i_7_n_0 ));
  FDRE \rdata_reg_reg[0] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[0]),
        .Q(s_axi_rdata[0]),
        .R(clear));
  FDRE \rdata_reg_reg[10] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[10]),
        .Q(s_axi_rdata[10]),
        .R(clear));
  FDRE \rdata_reg_reg[11] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[11]),
        .Q(s_axi_rdata[11]),
        .R(clear));
  FDRE \rdata_reg_reg[12] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[12]),
        .Q(s_axi_rdata[12]),
        .R(clear));
  FDRE \rdata_reg_reg[13] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[13]),
        .Q(s_axi_rdata[13]),
        .R(clear));
  FDRE \rdata_reg_reg[14] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[14]),
        .Q(s_axi_rdata[14]),
        .R(clear));
  FDRE \rdata_reg_reg[15] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[15]),
        .Q(s_axi_rdata[15]),
        .R(clear));
  FDRE \rdata_reg_reg[16] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[16]),
        .Q(s_axi_rdata[16]),
        .R(clear));
  FDRE \rdata_reg_reg[17] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[17]),
        .Q(s_axi_rdata[17]),
        .R(clear));
  FDRE \rdata_reg_reg[18] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[18]),
        .Q(s_axi_rdata[18]),
        .R(clear));
  FDRE \rdata_reg_reg[19] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[19]),
        .Q(s_axi_rdata[19]),
        .R(clear));
  FDRE \rdata_reg_reg[1] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[1]),
        .Q(s_axi_rdata[1]),
        .R(clear));
  FDRE \rdata_reg_reg[20] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[20]),
        .Q(s_axi_rdata[20]),
        .R(clear));
  FDRE \rdata_reg_reg[21] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[21]),
        .Q(s_axi_rdata[21]),
        .R(clear));
  FDRE \rdata_reg_reg[22] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[22]),
        .Q(s_axi_rdata[22]),
        .R(clear));
  FDRE \rdata_reg_reg[23] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[23]),
        .Q(s_axi_rdata[23]),
        .R(clear));
  FDRE \rdata_reg_reg[24] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[24]),
        .Q(s_axi_rdata[24]),
        .R(clear));
  FDRE \rdata_reg_reg[25] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[25]),
        .Q(s_axi_rdata[25]),
        .R(clear));
  FDRE \rdata_reg_reg[26] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[26]),
        .Q(s_axi_rdata[26]),
        .R(clear));
  FDRE \rdata_reg_reg[27] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[27]),
        .Q(s_axi_rdata[27]),
        .R(clear));
  FDRE \rdata_reg_reg[28] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[28]),
        .Q(s_axi_rdata[28]),
        .R(clear));
  FDRE \rdata_reg_reg[29] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[29]),
        .Q(s_axi_rdata[29]),
        .R(clear));
  FDRE \rdata_reg_reg[2] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[2]),
        .Q(s_axi_rdata[2]),
        .R(clear));
  FDRE \rdata_reg_reg[30] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[30]),
        .Q(s_axi_rdata[30]),
        .R(clear));
  FDRE \rdata_reg_reg[31] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[31]),
        .Q(s_axi_rdata[31]),
        .R(clear));
  FDRE \rdata_reg_reg[3] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[3]),
        .Q(s_axi_rdata[3]),
        .R(clear));
  FDRE \rdata_reg_reg[4] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[4]),
        .Q(s_axi_rdata[4]),
        .R(clear));
  FDRE \rdata_reg_reg[5] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[5]),
        .Q(s_axi_rdata[5]),
        .R(clear));
  FDRE \rdata_reg_reg[6] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[6]),
        .Q(s_axi_rdata[6]),
        .R(clear));
  FDRE \rdata_reg_reg[7] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[7]),
        .Q(s_axi_rdata[7]),
        .R(clear));
  FDRE \rdata_reg_reg[8] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[8]),
        .Q(s_axi_rdata[8]),
        .R(clear));
  FDRE \rdata_reg_reg[9] 
       (.C(clk),
        .CE(\rdata_reg[31]_i_1_n_0 ),
        .D(duty_cycle_reg[9]),
        .Q(s_axi_rdata[9]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF222)) 
    rvalid_reg_i_1
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(s_axi_arready),
        .I3(s_axi_arvalid),
        .O(rvalid_reg_i_1_n_0));
  FDRE rvalid_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(rvalid_reg_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(clear));
  LUT2 #(
    .INIT(4'h2)) 
    wready_reg_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_wready),
        .O(wready_reg0));
  FDRE wready_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(wready_reg0),
        .Q(s_axi_wready),
        .R(clear));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axi_pwm_0_0,axi_pwm,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axi_pwm,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    resetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    pwm_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET resetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_rready;
  output pwm_out;

  wire \<const0> ;
  wire clk;
  wire pwm_out;
  wire resetn;
  wire [31:0]s_axi_araddr;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;

  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_pwm inst
       (.clk(clk),
        .pwm_out(pwm_out),
        .resetn(resetn),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid));
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
