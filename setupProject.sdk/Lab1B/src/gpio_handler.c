/*
 * gpio_handler.c
 *
 *  Created on: Oct 13, 2022
 *      Author: baron
 */


#include "gpio_handler.h"


void gpio_handler(void *CallBack)
{
	//funct pntr for gpio cntrl
	XGpio *GpioPtr = (XGpio *)CallBack; //???
	XGpio_InterruptClear(GpioPtr, GlobalIntrMask);
	int ButtonStatus = XGpio_DiscreteRead(&sys_gpio,1); // 1 == button channel

	if(ButtonStatus == 0x04)
	{
		//Right: start
		start = 1;
	}
	else if(ButtonStatus ==  0x02)
		//left: stop
		start = 0;
	else if(ButtonStatus == 0x10)
	{
		//center: reset
		clearSevenSeg();
		start = 0;
	}
	else if(ButtonStatus == 0x01){
		//up: incr
		dir = 1;
		//start = 1;
	}
	else if(ButtonStatus == 0x08){
		//down: decr
		dir = 0;
		//start = 1;
	}

}
