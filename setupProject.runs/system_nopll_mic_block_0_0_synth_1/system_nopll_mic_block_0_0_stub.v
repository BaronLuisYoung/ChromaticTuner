// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.3 (win64) Build 2644227 Wed Sep  4 09:45:24 MDT 2019
// Date        : Wed Nov  9 14:39:50 2022
// Host        : BaronsXPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_nopll_mic_block_0_0_stub.v
// Design      : system_nopll_mic_block_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "nopll_mic_block,Vivado 2019.1.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(sys_clk, sys_rst, mic_clk, mic_lr_sel, 
  mic_data_in, m_axis_tdata, m_axis_tvalid, m_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="sys_clk,sys_rst,mic_clk,mic_lr_sel,mic_data_in,m_axis_tdata[31:0],m_axis_tvalid,m_axis_tready" */;
  input sys_clk;
  input sys_rst;
  output mic_clk;
  output mic_lr_sel;
  input mic_data_in;
  output [31:0]m_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
endmodule
