-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Tue May 28 22:47:51 2024
-- Host        : DESKTOP-O0A6U7N running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/jgpei/ebaz_hello_world/ebaz_hello_world.gen/sources_1/bd/design_1/ip/design_1_axi_pwm_0_0/design_1_axi_pwm_0_0_sim_netlist.vhdl
-- Design      : design_1_axi_pwm_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_pwm_0_0_axi_pwm is
  port (
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pwm_out : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    clk : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    resetn : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_axi_pwm_0_0_axi_pwm : entity is "axi_pwm";
end design_1_axi_pwm_0_0_axi_pwm;

architecture STRUCTURE of design_1_axi_pwm_0_0_axi_pwm is
  signal arready_reg0 : STD_LOGIC;
  signal awready_reg0 : STD_LOGIC;
  signal bvalid_reg_i_1_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal duty_cycle_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \duty_cycle_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \duty_cycle_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \duty_cycle_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \duty_cycle_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \duty_cycle_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \duty_cycle_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \duty_cycle_reg[31]_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__0_n_1\ : STD_LOGIC;
  signal \pwm_out_carry__0_n_2\ : STD_LOGIC;
  signal \pwm_out_carry__0_n_3\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__1_n_1\ : STD_LOGIC;
  signal \pwm_out_carry__1_n_2\ : STD_LOGIC;
  signal \pwm_out_carry__1_n_3\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \pwm_out_carry__2_n_1\ : STD_LOGIC;
  signal \pwm_out_carry__2_n_2\ : STD_LOGIC;
  signal \pwm_out_carry__2_n_3\ : STD_LOGIC;
  signal pwm_out_carry_i_1_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_2_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_3_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_4_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_5_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_6_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_7_n_0 : STD_LOGIC;
  signal pwm_out_carry_i_8_n_0 : STD_LOGIC;
  signal pwm_out_carry_n_0 : STD_LOGIC;
  signal pwm_out_carry_n_1 : STD_LOGIC;
  signal pwm_out_carry_n_2 : STD_LOGIC;
  signal pwm_out_carry_n_3 : STD_LOGIC;
  signal \rdata_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \rdata_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \rdata_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \rdata_reg[31]_i_7_n_0\ : STD_LOGIC;
  signal rvalid_reg_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal wready_reg0 : STD_LOGIC;
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_pwm_out_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_out_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of arready_reg_i_1 : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of pwm_out_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \pwm_out_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \pwm_out_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \pwm_out_carry__2\ : label is 11;
  attribute SOFT_HLUTNM of rvalid_reg_i_1 : label is "soft_lutpair0";
begin
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_rvalid <= \^s_axi_rvalid\;
  s_axi_wready <= \^s_axi_wready\;
arready_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => arready_reg0
    );
arready_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => arready_reg0,
      Q => \^s_axi_arready\,
      R => clear
    );
awready_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => clear
    );
awready_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => \^s_axi_awready\,
      O => awready_reg0
    );
awready_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => awready_reg0,
      Q => \^s_axi_awready\,
      R => clear
    );
bvalid_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F222222222222222"
    )
        port map (
      I0 => \^s_axi_bvalid\,
      I1 => s_axi_bready,
      I2 => s_axi_awvalid,
      I3 => \^s_axi_awready\,
      I4 => s_axi_wvalid,
      I5 => \^s_axi_wready\,
      O => bvalid_reg_i_1_n_0
    );
bvalid_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => bvalid_reg_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => clear
    );
\counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_2_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_7\,
      Q => counter_reg(0),
      R => clear
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2) => \counter_reg[0]_i_1_n_1\,
      CO(1) => \counter_reg[0]_i_1_n_2\,
      CO(0) => \counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => clear
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => clear
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => clear
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => clear
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => clear
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => clear
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => clear
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => clear
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => clear
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => clear
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_6\,
      Q => counter_reg(1),
      R => clear
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => clear
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => clear
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => clear
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => clear
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => clear
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => clear
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => clear
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => clear
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => clear
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[28]_i_1_n_1\,
      CO(1) => \counter_reg[28]_i_1_n_2\,
      CO(0) => \counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[28]_i_1_n_4\,
      O(2) => \counter_reg[28]_i_1_n_5\,
      O(1) => \counter_reg[28]_i_1_n_6\,
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => counter_reg(31 downto 28)
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_6\,
      Q => counter_reg(29),
      R => clear
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_5\,
      Q => counter_reg(2),
      R => clear
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_5\,
      Q => counter_reg(30),
      R => clear
    );
\counter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_4\,
      Q => counter_reg(31),
      R => clear
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_1_n_4\,
      Q => counter_reg(3),
      R => clear
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => clear
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => clear
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => clear
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => clear
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => clear
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => clear
    );
\duty_cycle_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \duty_cycle_reg[31]_i_2_n_0\,
      I1 => \duty_cycle_reg[31]_i_3_n_0\,
      I2 => \duty_cycle_reg[31]_i_4_n_0\,
      I3 => \duty_cycle_reg[31]_i_5_n_0\,
      I4 => \duty_cycle_reg[31]_i_6_n_0\,
      I5 => \duty_cycle_reg[31]_i_7_n_0\,
      O => \duty_cycle_reg[31]_i_1_n_0\
    );
\duty_cycle_reg[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => \^s_axi_wready\,
      I2 => s_axi_awaddr(30),
      I3 => s_axi_awaddr(31),
      I4 => \^s_axi_awready\,
      I5 => s_axi_awvalid,
      O => \duty_cycle_reg[31]_i_2_n_0\
    );
\duty_cycle_reg[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_awaddr(20),
      I1 => s_axi_awaddr(21),
      I2 => s_axi_awaddr(18),
      I3 => s_axi_awaddr(19),
      I4 => s_axi_awaddr(23),
      I5 => s_axi_awaddr(22),
      O => \duty_cycle_reg[31]_i_3_n_0\
    );
\duty_cycle_reg[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_awaddr(2),
      I1 => s_axi_awaddr(3),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => s_axi_awaddr(5),
      I5 => s_axi_awaddr(4),
      O => \duty_cycle_reg[31]_i_4_n_0\
    );
\duty_cycle_reg[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_awaddr(26),
      I1 => s_axi_awaddr(27),
      I2 => s_axi_awaddr(24),
      I3 => s_axi_awaddr(25),
      I4 => s_axi_awaddr(29),
      I5 => s_axi_awaddr(28),
      O => \duty_cycle_reg[31]_i_5_n_0\
    );
\duty_cycle_reg[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_awaddr(8),
      I1 => s_axi_awaddr(9),
      I2 => s_axi_awaddr(6),
      I3 => s_axi_awaddr(7),
      I4 => s_axi_awaddr(11),
      I5 => s_axi_awaddr(10),
      O => \duty_cycle_reg[31]_i_6_n_0\
    );
\duty_cycle_reg[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_awaddr(14),
      I1 => s_axi_awaddr(15),
      I2 => s_axi_awaddr(12),
      I3 => s_axi_awaddr(13),
      I4 => s_axi_awaddr(17),
      I5 => s_axi_awaddr(16),
      O => \duty_cycle_reg[31]_i_7_n_0\
    );
\duty_cycle_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(0),
      Q => duty_cycle_reg(0),
      R => clear
    );
\duty_cycle_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(10),
      Q => duty_cycle_reg(10),
      R => clear
    );
\duty_cycle_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(11),
      Q => duty_cycle_reg(11),
      R => clear
    );
\duty_cycle_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(12),
      Q => duty_cycle_reg(12),
      R => clear
    );
\duty_cycle_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(13),
      Q => duty_cycle_reg(13),
      R => clear
    );
\duty_cycle_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(14),
      Q => duty_cycle_reg(14),
      R => clear
    );
\duty_cycle_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(15),
      Q => duty_cycle_reg(15),
      R => clear
    );
\duty_cycle_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(16),
      Q => duty_cycle_reg(16),
      R => clear
    );
\duty_cycle_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(17),
      Q => duty_cycle_reg(17),
      R => clear
    );
\duty_cycle_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(18),
      Q => duty_cycle_reg(18),
      R => clear
    );
\duty_cycle_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(19),
      Q => duty_cycle_reg(19),
      R => clear
    );
\duty_cycle_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(1),
      Q => duty_cycle_reg(1),
      R => clear
    );
\duty_cycle_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(20),
      Q => duty_cycle_reg(20),
      R => clear
    );
\duty_cycle_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(21),
      Q => duty_cycle_reg(21),
      R => clear
    );
\duty_cycle_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(22),
      Q => duty_cycle_reg(22),
      R => clear
    );
\duty_cycle_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(23),
      Q => duty_cycle_reg(23),
      R => clear
    );
\duty_cycle_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(24),
      Q => duty_cycle_reg(24),
      R => clear
    );
\duty_cycle_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(25),
      Q => duty_cycle_reg(25),
      R => clear
    );
\duty_cycle_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(26),
      Q => duty_cycle_reg(26),
      R => clear
    );
\duty_cycle_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(27),
      Q => duty_cycle_reg(27),
      R => clear
    );
\duty_cycle_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(28),
      Q => duty_cycle_reg(28),
      R => clear
    );
\duty_cycle_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(29),
      Q => duty_cycle_reg(29),
      R => clear
    );
\duty_cycle_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(2),
      Q => duty_cycle_reg(2),
      R => clear
    );
\duty_cycle_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(30),
      Q => duty_cycle_reg(30),
      R => clear
    );
\duty_cycle_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(31),
      Q => duty_cycle_reg(31),
      R => clear
    );
\duty_cycle_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(3),
      Q => duty_cycle_reg(3),
      R => clear
    );
\duty_cycle_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(4),
      Q => duty_cycle_reg(4),
      R => clear
    );
\duty_cycle_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(5),
      Q => duty_cycle_reg(5),
      R => clear
    );
\duty_cycle_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(6),
      Q => duty_cycle_reg(6),
      R => clear
    );
\duty_cycle_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(7),
      Q => duty_cycle_reg(7),
      R => clear
    );
\duty_cycle_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(8),
      Q => duty_cycle_reg(8),
      R => clear
    );
\duty_cycle_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \duty_cycle_reg[31]_i_1_n_0\,
      D => s_axi_wdata(9),
      Q => duty_cycle_reg(9),
      R => clear
    );
pwm_out_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pwm_out_carry_n_0,
      CO(2) => pwm_out_carry_n_1,
      CO(1) => pwm_out_carry_n_2,
      CO(0) => pwm_out_carry_n_3,
      CYINIT => '0',
      DI(3) => pwm_out_carry_i_1_n_0,
      DI(2) => pwm_out_carry_i_2_n_0,
      DI(1) => pwm_out_carry_i_3_n_0,
      DI(0) => pwm_out_carry_i_4_n_0,
      O(3 downto 0) => NLW_pwm_out_carry_O_UNCONNECTED(3 downto 0),
      S(3) => pwm_out_carry_i_5_n_0,
      S(2) => pwm_out_carry_i_6_n_0,
      S(1) => pwm_out_carry_i_7_n_0,
      S(0) => pwm_out_carry_i_8_n_0
    );
\pwm_out_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => pwm_out_carry_n_0,
      CO(3) => \pwm_out_carry__0_n_0\,
      CO(2) => \pwm_out_carry__0_n_1\,
      CO(1) => \pwm_out_carry__0_n_2\,
      CO(0) => \pwm_out_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_out_carry__0_i_1_n_0\,
      DI(2) => \pwm_out_carry__0_i_2_n_0\,
      DI(1) => \pwm_out_carry__0_i_3_n_0\,
      DI(0) => \pwm_out_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_pwm_out_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_out_carry__0_i_5_n_0\,
      S(2) => \pwm_out_carry__0_i_6_n_0\,
      S(1) => \pwm_out_carry__0_i_7_n_0\,
      S(0) => \pwm_out_carry__0_i_8_n_0\
    );
\pwm_out_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(14),
      I1 => counter_reg(14),
      I2 => counter_reg(15),
      I3 => duty_cycle_reg(15),
      O => \pwm_out_carry__0_i_1_n_0\
    );
\pwm_out_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(12),
      I1 => counter_reg(12),
      I2 => counter_reg(13),
      I3 => duty_cycle_reg(13),
      O => \pwm_out_carry__0_i_2_n_0\
    );
\pwm_out_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(10),
      I1 => counter_reg(10),
      I2 => counter_reg(11),
      I3 => duty_cycle_reg(11),
      O => \pwm_out_carry__0_i_3_n_0\
    );
\pwm_out_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(8),
      I1 => counter_reg(8),
      I2 => counter_reg(9),
      I3 => duty_cycle_reg(9),
      O => \pwm_out_carry__0_i_4_n_0\
    );
\pwm_out_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(14),
      I1 => counter_reg(14),
      I2 => duty_cycle_reg(15),
      I3 => counter_reg(15),
      O => \pwm_out_carry__0_i_5_n_0\
    );
\pwm_out_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(12),
      I1 => counter_reg(12),
      I2 => duty_cycle_reg(13),
      I3 => counter_reg(13),
      O => \pwm_out_carry__0_i_6_n_0\
    );
\pwm_out_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(10),
      I1 => counter_reg(10),
      I2 => duty_cycle_reg(11),
      I3 => counter_reg(11),
      O => \pwm_out_carry__0_i_7_n_0\
    );
\pwm_out_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(8),
      I1 => counter_reg(8),
      I2 => duty_cycle_reg(9),
      I3 => counter_reg(9),
      O => \pwm_out_carry__0_i_8_n_0\
    );
\pwm_out_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out_carry__0_n_0\,
      CO(3) => \pwm_out_carry__1_n_0\,
      CO(2) => \pwm_out_carry__1_n_1\,
      CO(1) => \pwm_out_carry__1_n_2\,
      CO(0) => \pwm_out_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_out_carry__1_i_1_n_0\,
      DI(2) => \pwm_out_carry__1_i_2_n_0\,
      DI(1) => \pwm_out_carry__1_i_3_n_0\,
      DI(0) => \pwm_out_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_pwm_out_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_out_carry__1_i_5_n_0\,
      S(2) => \pwm_out_carry__1_i_6_n_0\,
      S(1) => \pwm_out_carry__1_i_7_n_0\,
      S(0) => \pwm_out_carry__1_i_8_n_0\
    );
\pwm_out_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(22),
      I1 => counter_reg(22),
      I2 => counter_reg(23),
      I3 => duty_cycle_reg(23),
      O => \pwm_out_carry__1_i_1_n_0\
    );
\pwm_out_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(20),
      I1 => counter_reg(20),
      I2 => counter_reg(21),
      I3 => duty_cycle_reg(21),
      O => \pwm_out_carry__1_i_2_n_0\
    );
\pwm_out_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(18),
      I1 => counter_reg(18),
      I2 => counter_reg(19),
      I3 => duty_cycle_reg(19),
      O => \pwm_out_carry__1_i_3_n_0\
    );
\pwm_out_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(16),
      I1 => counter_reg(16),
      I2 => counter_reg(17),
      I3 => duty_cycle_reg(17),
      O => \pwm_out_carry__1_i_4_n_0\
    );
\pwm_out_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(22),
      I1 => counter_reg(22),
      I2 => duty_cycle_reg(23),
      I3 => counter_reg(23),
      O => \pwm_out_carry__1_i_5_n_0\
    );
\pwm_out_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(20),
      I1 => counter_reg(20),
      I2 => duty_cycle_reg(21),
      I3 => counter_reg(21),
      O => \pwm_out_carry__1_i_6_n_0\
    );
\pwm_out_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(18),
      I1 => counter_reg(18),
      I2 => duty_cycle_reg(19),
      I3 => counter_reg(19),
      O => \pwm_out_carry__1_i_7_n_0\
    );
\pwm_out_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(16),
      I1 => counter_reg(16),
      I2 => duty_cycle_reg(17),
      I3 => counter_reg(17),
      O => \pwm_out_carry__1_i_8_n_0\
    );
\pwm_out_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_out_carry__1_n_0\,
      CO(3) => pwm_out,
      CO(2) => \pwm_out_carry__2_n_1\,
      CO(1) => \pwm_out_carry__2_n_2\,
      CO(0) => \pwm_out_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_out_carry__2_i_1_n_0\,
      DI(2) => \pwm_out_carry__2_i_2_n_0\,
      DI(1) => \pwm_out_carry__2_i_3_n_0\,
      DI(0) => \pwm_out_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_pwm_out_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_out_carry__2_i_5_n_0\,
      S(2) => \pwm_out_carry__2_i_6_n_0\,
      S(1) => \pwm_out_carry__2_i_7_n_0\,
      S(0) => \pwm_out_carry__2_i_8_n_0\
    );
\pwm_out_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(30),
      I1 => counter_reg(30),
      I2 => counter_reg(31),
      I3 => duty_cycle_reg(31),
      O => \pwm_out_carry__2_i_1_n_0\
    );
\pwm_out_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(28),
      I1 => counter_reg(28),
      I2 => counter_reg(29),
      I3 => duty_cycle_reg(29),
      O => \pwm_out_carry__2_i_2_n_0\
    );
\pwm_out_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(26),
      I1 => counter_reg(26),
      I2 => counter_reg(27),
      I3 => duty_cycle_reg(27),
      O => \pwm_out_carry__2_i_3_n_0\
    );
\pwm_out_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(24),
      I1 => counter_reg(24),
      I2 => counter_reg(25),
      I3 => duty_cycle_reg(25),
      O => \pwm_out_carry__2_i_4_n_0\
    );
\pwm_out_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(30),
      I1 => counter_reg(30),
      I2 => duty_cycle_reg(31),
      I3 => counter_reg(31),
      O => \pwm_out_carry__2_i_5_n_0\
    );
\pwm_out_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(28),
      I1 => counter_reg(28),
      I2 => duty_cycle_reg(29),
      I3 => counter_reg(29),
      O => \pwm_out_carry__2_i_6_n_0\
    );
\pwm_out_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(26),
      I1 => counter_reg(26),
      I2 => duty_cycle_reg(27),
      I3 => counter_reg(27),
      O => \pwm_out_carry__2_i_7_n_0\
    );
\pwm_out_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(24),
      I1 => counter_reg(24),
      I2 => duty_cycle_reg(25),
      I3 => counter_reg(25),
      O => \pwm_out_carry__2_i_8_n_0\
    );
pwm_out_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(6),
      I1 => counter_reg(6),
      I2 => counter_reg(7),
      I3 => duty_cycle_reg(7),
      O => pwm_out_carry_i_1_n_0
    );
pwm_out_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(4),
      I1 => counter_reg(4),
      I2 => counter_reg(5),
      I3 => duty_cycle_reg(5),
      O => pwm_out_carry_i_2_n_0
    );
pwm_out_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(2),
      I1 => counter_reg(2),
      I2 => counter_reg(3),
      I3 => duty_cycle_reg(3),
      O => pwm_out_carry_i_3_n_0
    );
pwm_out_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => duty_cycle_reg(0),
      I1 => counter_reg(0),
      I2 => counter_reg(1),
      I3 => duty_cycle_reg(1),
      O => pwm_out_carry_i_4_n_0
    );
pwm_out_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(6),
      I1 => counter_reg(6),
      I2 => duty_cycle_reg(7),
      I3 => counter_reg(7),
      O => pwm_out_carry_i_5_n_0
    );
pwm_out_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(4),
      I1 => counter_reg(4),
      I2 => duty_cycle_reg(5),
      I3 => counter_reg(5),
      O => pwm_out_carry_i_6_n_0
    );
pwm_out_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(2),
      I1 => counter_reg(2),
      I2 => duty_cycle_reg(3),
      I3 => counter_reg(3),
      O => pwm_out_carry_i_7_n_0
    );
pwm_out_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => duty_cycle_reg(0),
      I1 => counter_reg(0),
      I2 => duty_cycle_reg(1),
      I3 => counter_reg(1),
      O => pwm_out_carry_i_8_n_0
    );
\rdata_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \rdata_reg[31]_i_2_n_0\,
      I1 => \rdata_reg[31]_i_3_n_0\,
      I2 => \rdata_reg[31]_i_4_n_0\,
      I3 => \rdata_reg[31]_i_5_n_0\,
      I4 => \rdata_reg[31]_i_6_n_0\,
      I5 => \rdata_reg[31]_i_7_n_0\,
      O => \rdata_reg[31]_i_1_n_0\
    );
\rdata_reg[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_araddr(24),
      I1 => s_axi_araddr(25),
      I2 => s_axi_araddr(22),
      I3 => s_axi_araddr(23),
      I4 => s_axi_araddr(27),
      I5 => s_axi_araddr(26),
      O => \rdata_reg[31]_i_2_n_0\
    );
\rdata_reg[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => s_axi_araddr(30),
      I1 => s_axi_araddr(31),
      I2 => s_axi_araddr(28),
      I3 => s_axi_araddr(29),
      I4 => \^s_axi_arready\,
      I5 => s_axi_arvalid,
      O => \rdata_reg[31]_i_3_n_0\
    );
\rdata_reg[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_araddr(18),
      I1 => s_axi_araddr(19),
      I2 => s_axi_araddr(16),
      I3 => s_axi_araddr(17),
      I4 => s_axi_araddr(21),
      I5 => s_axi_araddr(20),
      O => \rdata_reg[31]_i_4_n_0\
    );
\rdata_reg[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_araddr(12),
      I1 => s_axi_araddr(13),
      I2 => s_axi_araddr(10),
      I3 => s_axi_araddr(11),
      I4 => s_axi_araddr(15),
      I5 => s_axi_araddr(14),
      O => \rdata_reg[31]_i_5_n_0\
    );
\rdata_reg[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(3),
      I3 => s_axi_araddr(2),
      O => \rdata_reg[31]_i_6_n_0\
    );
\rdata_reg[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_araddr(6),
      I1 => s_axi_araddr(7),
      I2 => s_axi_araddr(4),
      I3 => s_axi_araddr(5),
      I4 => s_axi_araddr(9),
      I5 => s_axi_araddr(8),
      O => \rdata_reg[31]_i_7_n_0\
    );
\rdata_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(0),
      Q => s_axi_rdata(0),
      R => clear
    );
\rdata_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(10),
      Q => s_axi_rdata(10),
      R => clear
    );
\rdata_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(11),
      Q => s_axi_rdata(11),
      R => clear
    );
\rdata_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(12),
      Q => s_axi_rdata(12),
      R => clear
    );
\rdata_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(13),
      Q => s_axi_rdata(13),
      R => clear
    );
\rdata_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(14),
      Q => s_axi_rdata(14),
      R => clear
    );
\rdata_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(15),
      Q => s_axi_rdata(15),
      R => clear
    );
\rdata_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(16),
      Q => s_axi_rdata(16),
      R => clear
    );
\rdata_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(17),
      Q => s_axi_rdata(17),
      R => clear
    );
\rdata_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(18),
      Q => s_axi_rdata(18),
      R => clear
    );
\rdata_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(19),
      Q => s_axi_rdata(19),
      R => clear
    );
\rdata_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(1),
      Q => s_axi_rdata(1),
      R => clear
    );
\rdata_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(20),
      Q => s_axi_rdata(20),
      R => clear
    );
\rdata_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(21),
      Q => s_axi_rdata(21),
      R => clear
    );
\rdata_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(22),
      Q => s_axi_rdata(22),
      R => clear
    );
\rdata_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(23),
      Q => s_axi_rdata(23),
      R => clear
    );
\rdata_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(24),
      Q => s_axi_rdata(24),
      R => clear
    );
\rdata_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(25),
      Q => s_axi_rdata(25),
      R => clear
    );
\rdata_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(26),
      Q => s_axi_rdata(26),
      R => clear
    );
\rdata_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(27),
      Q => s_axi_rdata(27),
      R => clear
    );
\rdata_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(28),
      Q => s_axi_rdata(28),
      R => clear
    );
\rdata_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(29),
      Q => s_axi_rdata(29),
      R => clear
    );
\rdata_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(2),
      Q => s_axi_rdata(2),
      R => clear
    );
\rdata_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(30),
      Q => s_axi_rdata(30),
      R => clear
    );
\rdata_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(31),
      Q => s_axi_rdata(31),
      R => clear
    );
\rdata_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(3),
      Q => s_axi_rdata(3),
      R => clear
    );
\rdata_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(4),
      Q => s_axi_rdata(4),
      R => clear
    );
\rdata_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(5),
      Q => s_axi_rdata(5),
      R => clear
    );
\rdata_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(6),
      Q => s_axi_rdata(6),
      R => clear
    );
\rdata_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(7),
      Q => s_axi_rdata(7),
      R => clear
    );
\rdata_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(8),
      Q => s_axi_rdata(8),
      R => clear
    );
\rdata_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rdata_reg[31]_i_1_n_0\,
      D => duty_cycle_reg(9),
      Q => s_axi_rdata(9),
      R => clear
    );
rvalid_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F222"
    )
        port map (
      I0 => \^s_axi_rvalid\,
      I1 => s_axi_rready,
      I2 => \^s_axi_arready\,
      I3 => s_axi_arvalid,
      O => rvalid_reg_i_1_n_0
    );
rvalid_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rvalid_reg_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => clear
    );
wready_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => \^s_axi_wready\,
      O => wready_reg0
    );
wready_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => wready_reg0,
      Q => \^s_axi_wready\,
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_pwm_0_0 is
  port (
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    pwm_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axi_pwm_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axi_pwm_0_0 : entity is "design_1_axi_pwm_0_0,axi_pwm,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axi_pwm_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_axi_pwm_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_axi_pwm_0_0 : entity is "axi_pwm,Vivado 2021.1";
end design_1_axi_pwm_0_0;

architecture STRUCTURE of design_1_axi_pwm_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET resetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi AWVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_rready : signal is "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi WVALID";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi ARADDR";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi AWADDR";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi WSTRB";
begin
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_axi_pwm_0_0_axi_pwm
     port map (
      clk => clk,
      pwm_out => pwm_out,
      resetn => resetn,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
