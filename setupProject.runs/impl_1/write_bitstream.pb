
r
Command: %s
1870*	planAhead2=
)open_checkpoint system_wrapper_routed.dcp2default:defaultZ12-2866h px? 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.027 . Memory (MB): peak = 294.797 ; gain = 0.0002default:defaulth px? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
14792default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
z
Netlist was created with %s %s291*project2
Vivado2default:default2
2019.1.32default:defaultZ1-479h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
?
?Could not create '%s' constraint because net '%s' is not directly connected to top level port. Synthesis is ignored for %s but preserved for implementation.
528*constraints2 
IBUF_LOW_PWR2default:default20
system_i/clk_wiz_0/clk_in12default:default2 
IBUF_LOW_PWR2default:default8Z18-550h px? 
L
*Restoring timing data from binary archive.264*timingZ38-478h px? 
F
$Binary timing data restore complete.265*timingZ38-479h px? 
L
*Restoring constraints from binary archive.481*projectZ1-856h px? 
E
#Binary constraint restore complete.478*projectZ1-853h px? 
?
Reading XDEF placement.
206*designutilsZ20-206h px? 
D
Reading placer database...
1602*designutilsZ20-1892h px? 
=
Reading XDEF routing.
207*designutilsZ20-207h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
Read XDEF File: 2default:default2
00:00:022default:default2
00:00:022default:default2
1593.6292default:default2
11.8712default:defaultZ17-268h px? 
?
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
2.0000002default:default2
0.0000002default:defaultZ20-1924h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common20
Finished XDEF File Restore: 2default:default2
00:00:022default:default2
00:00:022default:default2
1593.6292default:default2
11.8712default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0182default:default2
1593.6292default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 462 instances were transformed.
  CFGLUT5 => CFGLUT5 (SRLC32E, SRL16E): 60 instances
  IOBUFDS_INTERMDISABLE => IOBUFDS_INTERMDISABLE (IBUFDS_INTERMDISABLE_INT, IBUFDS_INTERMDISABLE_INT, INV, OBUFTDS, OBUFTDS): 2 instances
  IOBUF_INTERMDISABLE => IOBUF_INTERMDISABLE (IBUF_INTERMDISABLE, OBUFT): 16 instances
  LUT6_2 => LUT6_2 (LUT5, LUT6): 63 instances
  OBUFDS => OBUFDS_DUAL_BUF (INV, OBUFDS, OBUFDS): 1 instances
  RAM16X1D => RAM32X1D (RAMD32, RAMD32): 33 instances
  RAM32M => RAM32M (RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMS32, RAMS32): 285 instances
  SRLC16E => SRL16E: 1 instances
  SRLC32E => SRL16E: 1 instances
2default:defaultZ1-111h px? 
?
'Checkpoint was created with %s build %s378*project2-
Vivado v2019.1.3 (64-bit)2default:default2
26442272default:defaultZ1-604h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
open_checkpoint: 2default:default2
00:00:192default:default2
00:00:232default:default2
1593.6292default:default2
1298.8322default:defaultZ17-268h px? 
?
?The XPM instance: <%s> is part of IP: <%s>. This XPM instance will be excluded from the .mmi because updatemem is prohibited from making changes to an XPM that is part of an IP.
136*memdata2?
?system_i/spi/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/QSPI_LEGACY_MD_GEN.QSPI_CORE_INTERFACE_I/FIFO_EXISTS.TX_FIFO_II/xpm_fifo_instance.xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:default2 
system_i/spi2default:defaultZ28-208h px? 
?
?The XPM instance: <%s> is part of IP: <%s>. This XPM instance will be excluded from the .mmi because updatemem is prohibited from making changes to an XPM that is part of an IP.
136*memdata2?
?system_i/spi/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/QSPI_LEGACY_MD_GEN.QSPI_CORE_INTERFACE_I/FIFO_EXISTS.RX_FIFO_II/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:default2 
system_i/spi2default:defaultZ28-208h px? 
?
?The XPM instance: <%s> is part of IP: <%s>. This XPM instance will be excluded from the .mmi because updatemem is prohibited from making changes to an XPM that is part of an IP.
136*memdata2h
Tsystem_i/mic_block/stream_grabber_0/inst/xpm_memory_sdpram_inst/xpm_memory_base_inst2default:default27
#system_i/mic_block/stream_grabber_02default:defaultZ28-208h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s01_nodes/s01_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s01_nodes/s01_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s01_nodes/s01_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s01_nodes/s01_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s00_nodes/s00_w_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s00_nodes/s00_w_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s00_nodes/s00_w_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s00_nodes/s00_w_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s00_nodes/s00_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s00_nodes/s00_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s00_nodes/s00_aw_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s00_nodes/s00_aw_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/s00_nodes/s00_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/s00_nodes/s00_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_w_node/inst/inst_si_handler/gen_si_handler.gen_request_fifos.gen_req_fifo[0].inst_req_fifo/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_w_node/inst/inst_si_handler/gen_si_handler.gen_request_fifos.gen_req_fifo[0].inst_req_fifo/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_w_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_w_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_r_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_r_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_r_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_b_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_b_node/inst/inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_aw_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_aw_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
?
?Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2?
?system_i/axi_smc/inst/m00_nodes/m00_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
distributed2default:default2
block2default:default2?
?system_i/axi_smc/inst/m00_nodes/m00_ar_node/inst/inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory/xpm_memory_base_inst2default:defaultZ28-167h px? 
n
Command: %s
53*	vivadotcl2=
)write_bitstream -force system_wrapper.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
G
"No user IP repositories specified
1154*coregenZ19-1704h px? 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2019.1/data/ip2default:defaultZ19-2313h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A[29:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B[17:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A[29:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B[17:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_upper/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A[29:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B[17:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A[29:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B[17:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px? 
?

?PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/PATTERNDETECT?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/FPU_I/Use_FPU.FPU_MUL_I/Use_Single_DSP48E1.dsp_module_lower/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/PATTERNDETECT2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px? 
?

?PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P[47:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px? 
?
?MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2?
 "?
?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P[47:0]?system_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px? 
?
?Clock output buffering: PLLE2_ADV connectivity violation. The signal %s on the %s pin of %s does not drive the same kind of BUFFER load as the other CLKOUT pins. Routing from the different buffer types will not be phase aligned.%s*DRC2?
 "?
Vsystem_i/mig_7series_0/u_system_mig_7series_0_0_mig/u_ddr2_infrastructure/pll_clk3_outVsystem_i/mig_7series_0/u_system_mig_7series_0_0_mig/u_ddr2_infrastructure/pll_clk3_out2default:default2default:default2?
 "?
Ysystem_i/mig_7series_0/u_system_mig_7series_0_0_mig/u_ddr2_infrastructure/plle2_i/CLKOUT3Ysystem_i/mig_7series_0/u_system_mig_7series_0_0_mig/u_ddr2_infrastructure/plle2_i/CLKOUT32default:default2default:default2?
 "?
Qsystem_i/mig_7series_0/u_system_mig_7series_0_0_mig/u_ddr2_infrastructure/plle2_i	Qsystem_i/mig_7series_0/u_system_mig_7series_0_0_mig/u_ddr2_infrastructure/plle2_i2default:default2default:default2C
 +DRC|Netlist|Instance|Required Pin|PLLE2_ADV2default:default8Z	REQP-1709h px? 
?#
`No routable loads: 25 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2?"
 "?
?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/aempty_fwft_i?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/aempty_fwft_i2default:default"?
]dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD7_CTL/ctl_reg[2:0]Xdbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD7_CTL/ctl_reg2default:default"?
\dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD1/ctl_reg_en_2[1]\dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD1/ctl_reg_en_2[1]2default:default"?
`dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD7_CTL/ctl_reg_en_2[1]`dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD7_CTL/ctl_reg_en_2[1]2default:default"?
Rdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_capture[0]Odbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_capture2default:default"?
Odbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_drck[0]Ldbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_drck2default:default"?
Rdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_runtest[0]Odbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/m_bscan_runtest2default:default"?
?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwhf.whf/overflow?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwhf.whf/overflow2default:default"?
?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwhf.whf/overflow?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwhf.whf/overflow2default:default"?
?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_RD/U_RD_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_rdfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i2default:default"?
?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_i?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_i2default:default"?
?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/rd_rst_reg[0]?dbg_hub/inst/BSCANID.u_xsdbm_id/CORE_XSDB.UUT_MASTER/U_ICON_INTERFACE/U_CMD6_WR/U_WR_FIFO/SUBCORE_FIFO.xsdbm_v3_0_0_wrfifo_inst/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/rd_rst_reg[0]2default:default"?
Idbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_inst/s_bscan_tmsIdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_inst/s_bscan_tms2default:default"?
@u_ila_0/inst/ila_core_inst/u_ila_regs/U_XSDB_SLAVE/s_daddr_o[13]@u_ila_0/inst/ila_core_inst/u_ila_regs/U_XSDB_SLAVE/s_daddr_o[13]2default:default"?
@u_ila_0/inst/ila_core_inst/u_ila_regs/U_XSDB_SLAVE/s_daddr_o[14]@u_ila_0/inst/ila_core_inst/u_ila_regs/U_XSDB_SLAVE/s_daddr_o[14]2default:..."/
(the first 15 of 23 listed)2default:default2default:default2=
 %DRC|Implementation|Routing|Chip Level2default:default8Z	RTSTAT-10h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 13 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
?
MSuccessfully populated the BRAM INIT strings from the following elf files: %s96*memdata2?
sc:/Users/baron/setupProject/setupProject.srcs/sources_1/bd/system/ip/system_microblaze_0_0/data/mb_bootloop_le.elf 2default:defaultZ28-144h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
e
Writing bitstream %s...
11*	bitstream2(
./system_wrapper.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
s
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118h px? 
?
?'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2e
QC:/Users/baron/setupProject/setupProject.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Mon Nov 14 17:23:30 20222default:default2I
5C:/Xilinx/Vivado/2019.1/doc/webtalk_introduction.html2default:defaultZ17-186h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
412default:default2
142default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:332default:default2
00:00:272default:default2
2142.5552default:default2
526.5202default:defaultZ17-268h px? 


End Record