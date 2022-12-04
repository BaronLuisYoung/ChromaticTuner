connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys A7 -100T 210292B62127A" && level==0} -index 0
fpga -file C:/Users/baron/setupProject/setupProject.sdk/system_wrapper_hw_platform_0/download.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys A7 -100T 210292B62127A"} -index 0
rst -system
after 3000
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys A7 -100T 210292B62127A"} -index 0
dow C:/Users/baron/setupProject/setupProject.sdk/Lab3A/Debug/Lab3A.elf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys A7 -100T 210292B62127A"} -index 0
con
