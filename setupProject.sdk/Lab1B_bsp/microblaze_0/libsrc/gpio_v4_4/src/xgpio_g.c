
/*******************************************************************
*
* CAUTION: This file is automatically generated by HSI.
* Version: 2019.1.3
* DO NOT EDIT.
*
* Copyright (C) 2010-2022 Xilinx, Inc. All Rights Reserved.*
*Permission is hereby granted, free of charge, to any person obtaining a copy
*of this software and associated documentation files (the Software), to deal
*in the Software without restriction, including without limitation the rights
*to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*copies of the Software, and to permit persons to whom the Software is
*furnished to do so, subject to the following conditions:
*
*The above copyright notice and this permission notice shall be included in
*all copies or substantial portions of the Software.
* 
*THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
*XILINX BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
*WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
*OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
*Except as contained in this notice, the name of the Xilinx shall not be used
*in advertising or otherwise to promote the sale, use or other dealings in
*this Software without prior written authorization from Xilinx.
*

* 
* Description: Driver configuration
*
*******************************************************************/

#include "xparameters.h"
#include "xgpio.h"

/*
* The configuration table for devices
*/

XGpio_Config XGpio_ConfigTable[XPAR_XGPIO_NUM_INSTANCES] =
{
	{
		XPAR_AXI_GPIO_BTN_DEVICE_ID,
		XPAR_AXI_GPIO_BTN_BASEADDR,
		XPAR_AXI_GPIO_BTN_INTERRUPT_PRESENT,
		XPAR_AXI_GPIO_BTN_IS_DUAL
	},
	{
		XPAR_AXI_GPIO_LED_DEVICE_ID,
		XPAR_AXI_GPIO_LED_BASEADDR,
		XPAR_AXI_GPIO_LED_INTERRUPT_PRESENT,
		XPAR_AXI_GPIO_LED_IS_DUAL
	},
	{
		XPAR_ENCODER_DEVICE_ID,
		XPAR_ENCODER_BASEADDR,
		XPAR_ENCODER_INTERRUPT_PRESENT,
		XPAR_ENCODER_IS_DUAL
	},
	{
		XPAR_AXI_GPIO_RBG_LED_DEVICE_ID,
		XPAR_AXI_GPIO_RBG_LED_BASEADDR,
		XPAR_AXI_GPIO_RBG_LED_INTERRUPT_PRESENT,
		XPAR_AXI_GPIO_RBG_LED_IS_DUAL
	},
	{
		XPAR_SPI_DC_DEVICE_ID,
		XPAR_SPI_DC_BASEADDR,
		XPAR_SPI_DC_INTERRUPT_PRESENT,
		XPAR_SPI_DC_IS_DUAL
	}
};

