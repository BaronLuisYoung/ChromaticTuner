################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/gpio_handler.c \
../src/init.c \
../src/main.c \
../src/platform.c \
../src/timer_handler.c 

OBJS += \
./src/gpio_handler.o \
./src/init.o \
./src/main.o \
./src/platform.o \
./src/timer_handler.o 

C_DEPS += \
./src/gpio_handler.d \
./src/init.d \
./src/main.d \
./src/platform.d \
./src/timer_handler.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../Lab1B_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mcpu=v11.0 -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


