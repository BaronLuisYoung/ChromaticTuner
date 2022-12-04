################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/complex.c \
../src/fft.c \
../src/main.c \
../src/note.c \
../src/platform.c \
../src/stream_grabber.c \
../src/trig.c 

OBJS += \
./src/complex.o \
./src/fft.o \
./src/main.o \
./src/note.o \
./src/platform.o \
./src/stream_grabber.o \
./src/trig.o 

C_DEPS += \
./src/complex.d \
./src/fft.d \
./src/main.d \
./src/note.d \
./src/platform.d \
./src/stream_grabber.d \
./src/trig.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../test_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mcpu=v11.0 -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


