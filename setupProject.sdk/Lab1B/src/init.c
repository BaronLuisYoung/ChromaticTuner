/*Initialize function used from:
 * https://github.com/Tguzman636/ECE-153A-Embedded-System/blob/main/Lab%201/Lab%201B/ece153a_lab1b_AnthonyGuzman_BlakeRussell/lab2/src/sevenSeg_main.c*/

#include "init.h"


void initialize()
{
	XStatus Status;
	Status = XST_SUCCESS;

	Status = XIntc_Initialize(&sys_intctr, XPAR_INTC_0_DEVICE_ID);
	if ( Status != XST_SUCCESS )
	{
		xil_printf("Timer interrupt initialization failed...\r\n");
		return XST_FAILURE;
	}

	Status = XIntc_Connect(&sys_intctr, XPAR_INTC_0_TMRCTR_0_VEC_ID,
			(XInterruptHandler)timer_interrupt_handler, &sys_tmrctr);
	if ( Status != XST_SUCCESS )
	{
		xil_printf("Failed to connect the application handlers to the interrupt controller...\r\n");
		return XST_FAILURE;
	}

	Status = XIntc_Start(&sys_intctr, XIN_REAL_MODE);
	if ( Status != XST_SUCCESS )
	{
		xil_printf("Interrupt controller driver failed to start...\r\n");
		return XST_FAILURE;
	}

	XIntc_Enable(&sys_intctr, XPAR_INTC_0_TMRCTR_0_VEC_ID);

	Status = XTmrCtr_Initialize(&sys_tmrctr, XPAR_INTC_0_DEVICE_ID);
	if ( Status != XST_SUCCESS )
	{
		xil_printf("Timer initialization failed...\r\n");
		return XST_FAILURE;
	}

	XTmrCtr_SetOptions(&sys_tmrctr, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	XTmrCtr_SetResetValue(&sys_tmrctr, 0, 0xFFFFFFFF-RESET_VALUE);
	XTmrCtr_Start(&sys_tmrctr, 0);

	microblaze_register_handler((XInterruptHandler)XIntc_DeviceInterruptHandler,
				(void*)XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID);
	microblaze_enable_interrupts();

	if ( Status != XST_SUCCESS ){
	    xil_printf("Initialization failed.\r\n");
	    return XST_FAILURE;
	}
	xil_printf("Initialize TIMER Success.\r\n");

	Status = XST_SUCCESS;

	//GPIO INIT

	//inits XGIPO obj with device ID
	Status = XGpio_Initialize(&sys_gpio, XPAR_AXI_GPIO_BTN_DEVICE_ID);

	//checks if works
	if (Status != XST_SUCCESS) {
		xil_printf("sys_gpio initialization failed...\r\n");
		return XST_FAILURE;
	}
	//
	XIntc_Connect(&sys_intctr, XPAR_INTC_0_GPIO_0_VEC_ID, (Xil_ExceptionHandler)gpio_handler, &sys_gpio);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XIntc_Enable(&sys_intctr, XPAR_INTC_0_GPIO_0_VEC_ID);
	Status = XIntc_Start(&sys_intctr, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XGpio_InterruptEnable(&sys_gpio, 0x1);
	XGpio_InterruptGlobalEnable(&sys_gpio);

	if ( Status != XST_SUCCESS ){
	    xil_printf("Initialization failed.\r\n");
	    return XST_FAILURE;
	}
	xil_printf("Initialize GPIO Success.\r\n");
}
