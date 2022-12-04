//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1.3 (win64) Build 2644227 Wed Sep  4 09:45:24 MDT 2019
//Date        : Mon Nov 14 17:12:37 2022
//Host        : BaronsXPS running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR2_addr,
    DDR2_ba,
    DDR2_cas_n,
    DDR2_ck_n,
    DDR2_ck_p,
    DDR2_cke,
    DDR2_cs_n,
    DDR2_dm,
    DDR2_dq,
    DDR2_dqs_n,
    DDR2_dqs_p,
    DDR2_odt,
    DDR2_ras_n,
    DDR2_we_n,
    an,
    btn,
    btnCpuReset,
    clock_rtl,
    io0_o,
    jdport,
    led,
    mic_clk,
    mic_data_in,
    mic_lr_sel,
    reset_spi,
    rgbleds,
    sck_o,
    seg,
    spi_dc,
    ss_o);
  output [12:0]DDR2_addr;
  output [2:0]DDR2_ba;
  output DDR2_cas_n;
  output [0:0]DDR2_ck_n;
  output [0:0]DDR2_ck_p;
  output [0:0]DDR2_cke;
  output [0:0]DDR2_cs_n;
  output [1:0]DDR2_dm;
  inout [15:0]DDR2_dq;
  inout [1:0]DDR2_dqs_n;
  inout [1:0]DDR2_dqs_p;
  output [0:0]DDR2_odt;
  output DDR2_ras_n;
  output DDR2_we_n;
  output [7:0]an;
  input [4:0]btn;
  input btnCpuReset;
  input clock_rtl;
  output io0_o;
  input [2:0]jdport;
  output [15:0]led;
  output mic_clk;
  input mic_data_in;
  output mic_lr_sel;
  output reset_spi;
  output [5:0]rgbleds;
  output sck_o;
  output [6:0]seg;
  output [0:0]spi_dc;
  output [0:0]ss_o;

  wire [12:0]DDR2_addr;
  wire [2:0]DDR2_ba;
  wire DDR2_cas_n;
  wire [0:0]DDR2_ck_n;
  wire [0:0]DDR2_ck_p;
  wire [0:0]DDR2_cke;
  wire [0:0]DDR2_cs_n;
  wire [1:0]DDR2_dm;
  wire [15:0]DDR2_dq;
  wire [1:0]DDR2_dqs_n;
  wire [1:0]DDR2_dqs_p;
  wire [0:0]DDR2_odt;
  wire DDR2_ras_n;
  wire DDR2_we_n;
  wire [7:0]an;
  wire [4:0]btn;
  wire btnCpuReset;
  wire clock_rtl;
  wire io0_o;
  wire [2:0]jdport;
  wire [15:0]led;
  wire mic_clk;
  wire mic_data_in;
  wire mic_lr_sel;
  wire reset_spi;
  wire [5:0]rgbleds;
  wire sck_o;
  wire [6:0]seg;
  wire [0:0]spi_dc;
  wire [0:0]ss_o;

  system system_i
       (.DDR2_addr(DDR2_addr),
        .DDR2_ba(DDR2_ba),
        .DDR2_cas_n(DDR2_cas_n),
        .DDR2_ck_n(DDR2_ck_n),
        .DDR2_ck_p(DDR2_ck_p),
        .DDR2_cke(DDR2_cke),
        .DDR2_cs_n(DDR2_cs_n),
        .DDR2_dm(DDR2_dm),
        .DDR2_dq(DDR2_dq),
        .DDR2_dqs_n(DDR2_dqs_n),
        .DDR2_dqs_p(DDR2_dqs_p),
        .DDR2_odt(DDR2_odt),
        .DDR2_ras_n(DDR2_ras_n),
        .DDR2_we_n(DDR2_we_n),
        .an(an),
        .btn(btn),
        .btnCpuReset(btnCpuReset),
        .clock_rtl(clock_rtl),
        .io0_o(io0_o),
        .jdport(jdport),
        .led(led),
        .mic_clk(mic_clk),
        .mic_data_in(mic_data_in),
        .mic_lr_sel(mic_lr_sel),
        .reset_spi(reset_spi),
        .rgbleds(rgbleds),
        .sck_o(sck_o),
        .seg(seg),
        .spi_dc(spi_dc),
        .ss_o(ss_o));
endmodule
