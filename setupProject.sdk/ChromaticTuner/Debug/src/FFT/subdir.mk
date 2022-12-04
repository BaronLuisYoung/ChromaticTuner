################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/FFT/complex.c \
../src/FFT/note.c \
../src/FFT/stream_grabber.c \
../src/FFT/trig.c 

OBJS += \
./src/FFT/complex.o \
./src/FFT/note.o \
./src/FFT/stream_grabber.o \
./src/FFT/trig.o 

C_DEPS += \
./src/FFT/complex.d \
./src/FFT/note.d \
./src/FFT/stream_grabber.d \
./src/FFT/trig.d 


# Each subdirectory must supply rules for building sources it contributes
src/FFT/%.o: ../src/FFT/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../ChromaticTuner_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


