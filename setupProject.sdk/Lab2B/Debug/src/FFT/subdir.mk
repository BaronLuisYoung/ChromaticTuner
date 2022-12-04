################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/FFT/bsp.c \
../src/FFT/fonts.c \
../src/FFT/lab2a.c \
../src/FFT/lcd.c \
../src/FFT/main.c \
../src/FFT/qepn.c \
../src/FFT/qfn.c \
../src/FFT/qfn_init.c 

OBJS += \
./src/FFT/bsp.o \
./src/FFT/fonts.o \
./src/FFT/lab2a.o \
./src/FFT/lcd.o \
./src/FFT/main.o \
./src/FFT/qepn.o \
./src/FFT/qfn.o \
./src/FFT/qfn_init.o 

C_DEPS += \
./src/FFT/bsp.d \
./src/FFT/fonts.d \
./src/FFT/lab2a.d \
./src/FFT/lcd.d \
./src/FFT/main.d \
./src/FFT/qepn.d \
./src/FFT/qfn.d \
./src/FFT/qfn_init.d 


# Each subdirectory must supply rules for building sources it contributes
src/FFT/%.o: ../src/FFT/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../Lab2B_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mcpu=v11.0 -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


