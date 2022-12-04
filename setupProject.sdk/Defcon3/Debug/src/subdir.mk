################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/bsp.c \
../src/complex.c \
../src/fft.c \
../src/fonts.c \
../src/lcd.c \
../src/main.c \
../src/note.c \
../src/peripheral.c \
../src/platform.c \
../src/qepn.c \
../src/qfn.c \
../src/qfn_init.c \
../src/state_machine.c \
../src/stream_grabber.c \
../src/timing.c \
../src/trig.c 

OBJS += \
./src/bsp.o \
./src/complex.o \
./src/fft.o \
./src/fonts.o \
./src/lcd.o \
./src/main.o \
./src/note.o \
./src/peripheral.o \
./src/platform.o \
./src/qepn.o \
./src/qfn.o \
./src/qfn_init.o \
./src/state_machine.o \
./src/stream_grabber.o \
./src/timing.o \
./src/trig.o 

C_DEPS += \
./src/bsp.d \
./src/complex.d \
./src/fft.d \
./src/fonts.d \
./src/lcd.d \
./src/main.d \
./src/note.d \
./src/peripheral.d \
./src/platform.d \
./src/qepn.d \
./src/qfn.d \
./src/qfn_init.d \
./src/state_machine.d \
./src/stream_grabber.d \
./src/timing.d \
./src/trig.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../Defcon3_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


