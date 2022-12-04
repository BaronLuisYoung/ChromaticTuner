#define RESET_VALUE 0xF4240 // 1*10^6 @ 100MHz = 10ms

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include "xparameters.h"
#include "xintc.h"
#include "xgpio.h"
#include "xtmrctr.h"
#include "xil_cache.h"
#include "sevenSeg_new.h"

XIntc sys_intctr;	//system interrupts controller
XTmrCtr sys_tmrctr; //timer/clock interrupt
XGpio encoder_gpio;	//rotary encoder
XGpio rgb_led_gpio; //rgb leds
XGpio led_gpio; 	//regular leds

volatile unsigned int current_state = 0b11;
volatile unsigned int led_num = 0;
volatile unsigned int led_status = 1;
volatile unsigned int button_prev = 0;
volatile unsigned int seven_seg_state = 0;
volatile unsigned int enc1 = 1;
volatile unsigned int enc2 = 1;

void led_left()
{
	led_num = (led_num + 1)%16;
}

void led_right()
{
	led_num = (led_num - 1)%16;
}

void led_on()
{
	led_status = 1;
}

void led_off()
{
	led_status = 0;
}



/*________DEBOUNCED_STATEMACHINE_________*/
void state_machine(volatile int enc_input)
{
	//XGpio_InterruptDisable(&encoder_gpio, XGPIO_IR_CH1_MASK);
	switch(current_state)
	{
		case 1:
		seven_seg_state = 1;
		switch(enc_input)
		{
			case 0b01:
				current_state = 5;
				break;
			case 0b10:
				current_state = 2;
				break;
		}
			break;
		case 2:
		seven_seg_state = 2;
		switch(enc_input)
		{
			case 0b11:
				current_state = 1;
				break;
			case 0b00:
				current_state = 3;
				break;
		}
			break;
		case 3:
		seven_seg_state = 3;
		switch(enc_input)
		{
			case 0b01:
				current_state = 4;
				break;
			case 0b10:
				current_state = 2;
				break;
		}
			break;
		case 4:
		seven_seg_state = 4;
		switch(enc_input)
		{
			case 0b00:
				current_state = 3;
				break;
			case 0b11:
				led_left();
				current_state = 1;
				break;
		}
			break;
		case 5:
		seven_seg_state = 5;
		switch(enc_input)
		{
			case 0b00:
				current_state = 6;
				break;
			case 0b11:
				current_state = 1;
				break;
		}
			break;
		case 6:
		seven_seg_state = 6;
		switch(enc_input)
		{
			case 0b10:
				current_state = 7;
				break;
			case 0b01:
				current_state = 5;
				break;
		}
			break;
		case 7:
		seven_seg_state = 7;
		switch(enc_input)
		{
			case 0b11:
				led_right();
				current_state = 1;
				break;
			case 0b00:
				current_state = 6;
				break;
		}
			break;
	}
	//XGpio_InterruptEnable(&encoder_gpio, XGPIO_IR_CH1_MASK);
}

void timer_interrupt_handler()
{
	Xuint32 ControlStatusReg;
	int encoder_data = XGpio_DiscreteRead(&encoder_gpio, 1);

	volatile int enc_input = encoder_data & 0b11;
	volatile int enc_button = encoder_data & 0b100;
	/*enc1 = encoder_data & 0b01;
	enc2 = (encoder_data & 0b10) >> 1;*/

	if(enc_button == 0b100)
	{
		if(led_status)
			led_off();
		else
			led_on();
	}
	button_prev = encoder_data;

	if(led_status == 1)
		state_machine(enc_input);

	ControlStatusReg = XTimerCtr_ReadReg(sys_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET);
	XTmrCtr_WriteReg(sys_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET, ControlStatusReg |XTC_CSR_INT_OCCURED_MASK);
	XGpio_InterruptGlobalEnable(&encoder_gpio);
	XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
}

void encoder_interrupt_handler()
{
	XGpio_InterruptGlobalDisable(&encoder_gpio);
	int encoder_data = XGpio_DiscreteRead(&encoder_gpio, 1);

	if((encoder_data & 0b011) != (button_prev & 0b011))
	{
		XTmrCtr_SetResetValue(&sys_tmrctr, 0, 0xFFFFFFFF-20000);
		XTmrCtr_Start(&sys_tmrctr, 0);
		XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	}
	else if((encoder_data & 0b100) != (button_prev & 0b100))
	{
		XTmrCtr_SetResetValue(&sys_tmrctr, 0, 0xFFFFFFFF-2000000);
		XTmrCtr_Start(&sys_tmrctr, 0);
		XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	} else {
		XGpio_InterruptGlobalEnable(&encoder_gpio);
		XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	}
}

void init_all()
{
	    Xil_ICacheInvalidate();
		Xil_ICacheEnable();
		Xil_DCacheInvalidate();
		Xil_DCacheEnable();

		//status check
		XStatus Status;
		Status = XST_SUCCESS;

		/*_______________Internal Hardware SetUp________________*/

		/*Connects Interrupt Controller, Enables Interrupts*/
		Status = XIntc_Initialize(&sys_intctr, XPAR_INTC_0_DEVICE_ID);
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");

		Status = XIntc_Connect(&sys_intctr, XPAR_INTC_0_TMRCTR_0_VEC_ID, (XInterruptHandler)timer_interrupt_handler, &sys_tmrctr);
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");

		Status = XIntc_Start(&sys_intctr, XIN_REAL_MODE);
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");

		XIntc_Enable(&sys_intctr, XPAR_INTC_0_TMRCTR_0_VEC_ID);

		/*Connects Interrupt for Timer, Enables Interrupts for Timer*/
		Status = XTmrCtr_Initialize(&sys_tmrctr, XPAR_INTC_0_DEVICE_ID);
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");

		XTmrCtr_SetOptions(&sys_tmrctr, 0, XTC_INT_MODE_OPTION );
		XTmrCtr_SetResetValue(&sys_tmrctr, 0, 0xFFFFFFFF-2000000);
		XTmrCtr_Start(&sys_tmrctr, 0);

		/*Connects Interrupt Controller to MicroBlaze, Enables Interrupts to be received by MicroBlaze*/
		microblaze_register_handler((XInterruptHandler)XIntc_DeviceInterruptHandler,(void*)XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID);
		microblaze_enable_interrupts();


		/*_______________GPIO INIT________________*/

		/*Connects Interrupt Controller, Enables Interrupts to be received by MicroBlaze*/
		Status = XGpio_Initialize(&encoder_gpio, XPAR_ENCODER_DEVICE_ID); //init encoder
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");
		XIntc_Connect(&sys_intctr, XPAR_INTC_0_GPIO_0_VEC_ID, (Xil_ExceptionHandler)encoder_interrupt_handler, &encoder_gpio); //connect encoder
		XIntc_Enable(&sys_intctr, XPAR_INTC_0_GPIO_0_VEC_ID); //enable encoder
		Status = XIntc_Start(&sys_intctr, XIN_REAL_MODE);	  //starts encoder
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");

		XGpio_InterruptEnable(&encoder_gpio, 0x1);
		XGpio_InterruptGlobalEnable(&encoder_gpio);


		/*______________PERIPHERAL_INIT____________*/
		/*Enable RGB lights*/
		XGpio_Initialize(&rgb_led_gpio, XPAR_AXI_GPIO_RBG_LED_DEVICE_ID);
		/*Enable LED lights*/
		XGpio_Initialize(&led_gpio, XPAR_AXI_GPIO_LED_DEVICE_ID);


		Status = XST_SUCCESS;
		if (Status != XST_SUCCESS) xil_printf("Initialization failed.\r\n");
}

void write_LED()
{
	if (led_status)
	{
		XGpio_DiscreteWrite(&led_gpio, 1 , 1<<led_num);
	}
	else
	{
		XGpio_DiscreteWrite(&led_gpio, 1 , 0);
	}
}

int main()
{
	init_all();

	while(1)
	{
		XGpio_DiscreteWrite(&rgb_led_gpio, 1, 4);

		sevenseg_draw_digit (0, seven_seg_state);
		for (int Delay = 0; Delay < 1000; Delay++);
		sevenseg_draw_digit(2, enc1);
		for (int Delay = 0; Delay < 1000; Delay++);
		sevenseg_draw_digit(3, enc2);
		for (int Delay = 0; Delay < 1000; Delay++);

		write_LED();

	}
    return 0;
}
