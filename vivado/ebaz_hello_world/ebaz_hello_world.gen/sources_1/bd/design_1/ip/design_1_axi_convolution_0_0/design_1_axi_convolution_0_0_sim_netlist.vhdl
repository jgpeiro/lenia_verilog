-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
-- Date        : Sat Jun  1 19:17:42 2024
-- Host        : DESKTOP-O0A6U7N running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/jgpei/ebaz_hello_world/ebaz_hello_world.gen/sources_1/bd/design_1/ip/design_1_axi_convolution_0_0/design_1_axi_convolution_0_0_sim_netlist.vhdl
-- Design      : design_1_axi_convolution_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_convolution_0_0_axi_convolution is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_axi_convolution_0_0_axi_convolution : entity is "axi_convolution";
end design_1_axi_convolution_0_0_axi_convolution;

architecture STRUCTURE of design_1_axi_convolution_0_0_axi_convolution is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal axi_arready0 : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \kernel_reg[0][0]_0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_30_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair0";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_BVALID <= \^s_axi_bvalid\;
  S_AXI_RVALID <= \^s_axi_rvalid\;
  S_AXI_WREADY <= \^s_axi_wready\;
\axi_araddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(0),
      Q => axi_araddr(0),
      R => p_0_in
    );
\axi_araddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(1),
      Q => axi_araddr(1),
      R => p_0_in
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(2),
      Q => axi_araddr(2),
      R => p_0_in
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(3),
      Q => axi_araddr(3),
      R => p_0_in
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(4),
      Q => axi_araddr(4),
      R => p_0_in
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(5),
      Q => axi_araddr(5),
      R => p_0_in
    );
\axi_araddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(6),
      Q => axi_araddr(6),
      R => p_0_in
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => p_0_in
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => p_0_in
    );
axi_awready_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \^s_axi_awready\,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => p_0_in
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => S_AXI_AWVALID,
      I2 => S_AXI_WVALID,
      I3 => \^s_axi_wready\,
      I4 => S_AXI_BREADY,
      I5 => \^s_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => p_0_in
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(0),
      O => p_1_in(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(10),
      O => p_1_in(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(11),
      O => p_1_in(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(12),
      O => p_1_in(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(13),
      O => p_1_in(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(14),
      O => p_1_in(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(15),
      O => p_1_in(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(16),
      O => p_1_in(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(17),
      O => p_1_in(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(18),
      O => p_1_in(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(19),
      O => p_1_in(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(1),
      O => p_1_in(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(20),
      O => p_1_in(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(21),
      O => p_1_in(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(22),
      O => p_1_in(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(23),
      O => p_1_in(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(24),
      O => p_1_in(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(25),
      O => p_1_in(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(26),
      O => p_1_in(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(27),
      O => p_1_in(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(28),
      O => p_1_in(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(29),
      O => p_1_in(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(2),
      O => p_1_in(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(30),
      O => p_1_in(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \^s_axi_arready\,
      O => p_30_in
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(31),
      O => p_1_in(31)
    );
\axi_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => axi_araddr(5),
      I1 => axi_araddr(4),
      I2 => axi_araddr(3),
      I3 => axi_araddr(2),
      O => \axi_rdata[31]_i_3_n_0\
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(3),
      O => p_1_in(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(4),
      O => p_1_in(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(5),
      O => p_1_in(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(6),
      O => p_1_in(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(7),
      O => p_1_in(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(8),
      O => p_1_in(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => axi_araddr(1),
      I2 => axi_araddr(0),
      I3 => axi_araddr(6),
      I4 => \kernel_reg[0][0]_0\(9),
      O => p_1_in(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(0),
      Q => S_AXI_RDATA(0),
      R => p_0_in
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(10),
      Q => S_AXI_RDATA(10),
      R => p_0_in
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(11),
      Q => S_AXI_RDATA(11),
      R => p_0_in
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(12),
      Q => S_AXI_RDATA(12),
      R => p_0_in
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(13),
      Q => S_AXI_RDATA(13),
      R => p_0_in
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(14),
      Q => S_AXI_RDATA(14),
      R => p_0_in
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(15),
      Q => S_AXI_RDATA(15),
      R => p_0_in
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(16),
      Q => S_AXI_RDATA(16),
      R => p_0_in
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(17),
      Q => S_AXI_RDATA(17),
      R => p_0_in
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(18),
      Q => S_AXI_RDATA(18),
      R => p_0_in
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(19),
      Q => S_AXI_RDATA(19),
      R => p_0_in
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(1),
      Q => S_AXI_RDATA(1),
      R => p_0_in
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(20),
      Q => S_AXI_RDATA(20),
      R => p_0_in
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(21),
      Q => S_AXI_RDATA(21),
      R => p_0_in
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(22),
      Q => S_AXI_RDATA(22),
      R => p_0_in
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(23),
      Q => S_AXI_RDATA(23),
      R => p_0_in
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(24),
      Q => S_AXI_RDATA(24),
      R => p_0_in
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(25),
      Q => S_AXI_RDATA(25),
      R => p_0_in
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(26),
      Q => S_AXI_RDATA(26),
      R => p_0_in
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(27),
      Q => S_AXI_RDATA(27),
      R => p_0_in
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(28),
      Q => S_AXI_RDATA(28),
      R => p_0_in
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(29),
      Q => S_AXI_RDATA(29),
      R => p_0_in
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(2),
      Q => S_AXI_RDATA(2),
      R => p_0_in
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(30),
      Q => S_AXI_RDATA(30),
      R => p_0_in
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(31),
      Q => S_AXI_RDATA(31),
      R => p_0_in
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(3),
      Q => S_AXI_RDATA(3),
      R => p_0_in
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(4),
      Q => S_AXI_RDATA(4),
      R => p_0_in
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(5),
      Q => S_AXI_RDATA(5),
      R => p_0_in
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(6),
      Q => S_AXI_RDATA(6),
      R => p_0_in
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(7),
      Q => S_AXI_RDATA(7),
      R => p_0_in
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(8),
      Q => S_AXI_RDATA(8),
      R => p_0_in
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => p_30_in,
      D => p_1_in(9),
      Q => S_AXI_RDATA(9),
      R => p_0_in
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \^s_axi_arready\,
      I2 => \^s_axi_rvalid\,
      I3 => S_AXI_RREADY,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => p_0_in
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \^s_axi_wready\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => p_0_in
    );
\kernel_reg[0][0][0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(0),
      Q => \kernel_reg[0][0]_0\(0),
      R => p_0_in
    );
\kernel_reg[0][0][10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(10),
      Q => \kernel_reg[0][0]_0\(10),
      R => p_0_in
    );
\kernel_reg[0][0][11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(11),
      Q => \kernel_reg[0][0]_0\(11),
      R => p_0_in
    );
\kernel_reg[0][0][12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(12),
      Q => \kernel_reg[0][0]_0\(12),
      R => p_0_in
    );
\kernel_reg[0][0][13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(13),
      Q => \kernel_reg[0][0]_0\(13),
      R => p_0_in
    );
\kernel_reg[0][0][14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(14),
      Q => \kernel_reg[0][0]_0\(14),
      R => p_0_in
    );
\kernel_reg[0][0][15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(15),
      Q => \kernel_reg[0][0]_0\(15),
      R => p_0_in
    );
\kernel_reg[0][0][16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(16),
      Q => \kernel_reg[0][0]_0\(16),
      R => p_0_in
    );
\kernel_reg[0][0][17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(17),
      Q => \kernel_reg[0][0]_0\(17),
      R => p_0_in
    );
\kernel_reg[0][0][18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(18),
      Q => \kernel_reg[0][0]_0\(18),
      R => p_0_in
    );
\kernel_reg[0][0][19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(19),
      Q => \kernel_reg[0][0]_0\(19),
      R => p_0_in
    );
\kernel_reg[0][0][1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(1),
      Q => \kernel_reg[0][0]_0\(1),
      R => p_0_in
    );
\kernel_reg[0][0][20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(20),
      Q => \kernel_reg[0][0]_0\(20),
      R => p_0_in
    );
\kernel_reg[0][0][21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(21),
      Q => \kernel_reg[0][0]_0\(21),
      R => p_0_in
    );
\kernel_reg[0][0][22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(22),
      Q => \kernel_reg[0][0]_0\(22),
      R => p_0_in
    );
\kernel_reg[0][0][23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(23),
      Q => \kernel_reg[0][0]_0\(23),
      R => p_0_in
    );
\kernel_reg[0][0][24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(24),
      Q => \kernel_reg[0][0]_0\(24),
      R => p_0_in
    );
\kernel_reg[0][0][25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(25),
      Q => \kernel_reg[0][0]_0\(25),
      R => p_0_in
    );
\kernel_reg[0][0][26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(26),
      Q => \kernel_reg[0][0]_0\(26),
      R => p_0_in
    );
\kernel_reg[0][0][27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(27),
      Q => \kernel_reg[0][0]_0\(27),
      R => p_0_in
    );
\kernel_reg[0][0][28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(28),
      Q => \kernel_reg[0][0]_0\(28),
      R => p_0_in
    );
\kernel_reg[0][0][29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(29),
      Q => \kernel_reg[0][0]_0\(29),
      R => p_0_in
    );
\kernel_reg[0][0][2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(2),
      Q => \kernel_reg[0][0]_0\(2),
      R => p_0_in
    );
\kernel_reg[0][0][30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(30),
      Q => \kernel_reg[0][0]_0\(30),
      R => p_0_in
    );
\kernel_reg[0][0][31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(31),
      Q => \kernel_reg[0][0]_0\(31),
      R => p_0_in
    );
\kernel_reg[0][0][3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(3),
      Q => \kernel_reg[0][0]_0\(3),
      R => p_0_in
    );
\kernel_reg[0][0][4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(4),
      Q => \kernel_reg[0][0]_0\(4),
      R => p_0_in
    );
\kernel_reg[0][0][5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(5),
      Q => \kernel_reg[0][0]_0\(5),
      R => p_0_in
    );
\kernel_reg[0][0][6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(6),
      Q => \kernel_reg[0][0]_0\(6),
      R => p_0_in
    );
\kernel_reg[0][0][7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(7),
      Q => \kernel_reg[0][0]_0\(7),
      R => p_0_in
    );
\kernel_reg[0][0][8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(8),
      Q => \kernel_reg[0][0]_0\(8),
      R => p_0_in
    );
\kernel_reg[0][0][9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(9),
      Q => \kernel_reg[0][0]_0\(9),
      R => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_convolution_0_0 is
  port (
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axi_convolution_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axi_convolution_0_0 : entity is "design_1_axi_convolution_0_0,axi_convolution,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axi_convolution_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_axi_convolution_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_axi_convolution_0_0 : entity is "axi_convolution,Vivado 2021.1";
end design_1_axi_convolution_0_0;

architecture STRUCTURE of design_1_axi_convolution_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of S_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of S_AXI_ACLK : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of S_AXI_ARESETN : signal is "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of S_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of S_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of S_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of S_AXI_RREADY : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of S_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of S_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of S_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of S_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_INFO of S_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of S_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of S_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of S_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of S_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_axi_convolution_0_0_axi_convolution
     port map (
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(6 downto 0) => S_AXI_ARADDR(6 downto 0),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_WVALID => S_AXI_WVALID
    );
end STRUCTURE;
