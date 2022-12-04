-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.3 (win64) Build 2644227 Wed Sep  4 09:45:24 MDT 2019
-- Date        : Wed Nov  9 14:39:49 2022
-- Host        : BaronsXPS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_stream_grabber_0_0_stub.vhdl
-- Design      : system_stream_grabber_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    sys_clk : in STD_LOGIC;
    sys_rst : in STD_LOGIC;
    s_axis_stream_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_stream_tvalid : in STD_LOGIC;
    s_axis_stream_tready : out STD_LOGIC;
    s_axi_cpu_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_cpu_awvalid : in STD_LOGIC;
    s_axi_cpu_awready : out STD_LOGIC;
    s_axi_cpu_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_cpu_wvalid : in STD_LOGIC;
    s_axi_cpu_wready : out STD_LOGIC;
    s_axi_cpu_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_cpu_bvalid : out STD_LOGIC;
    s_axi_cpu_bready : in STD_LOGIC;
    s_axi_cpu_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_cpu_arvalid : in STD_LOGIC;
    s_axi_cpu_arready : out STD_LOGIC;
    s_axi_cpu_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_cpu_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_cpu_rvalid : out STD_LOGIC;
    s_axi_cpu_rready : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sys_clk,sys_rst,s_axis_stream_tdata[31:0],s_axis_stream_tvalid,s_axis_stream_tready,s_axi_cpu_awaddr[11:0],s_axi_cpu_awvalid,s_axi_cpu_awready,s_axi_cpu_wdata[31:0],s_axi_cpu_wvalid,s_axi_cpu_wready,s_axi_cpu_bresp[1:0],s_axi_cpu_bvalid,s_axi_cpu_bready,s_axi_cpu_araddr[11:0],s_axi_cpu_arvalid,s_axi_cpu_arready,s_axi_cpu_rdata[31:0],s_axi_cpu_rresp[1:0],s_axi_cpu_rvalid,s_axi_cpu_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "stream_grabber,Vivado 2019.1.3";
begin
end;
