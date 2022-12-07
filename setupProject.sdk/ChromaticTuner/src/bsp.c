/*****************************************************************************
 * bsp.c for Lab2A of ECE 153a at UCSB
 * Date of the Last Update:  October 27,2019
 *****************************************************************************/
/**/
#include "qpn_port.h"
#include "bsp.h"
#include "lab2a.h"
#include "xintc.h"
#include "xil_exception.h"
#include "xtmrctr.h"
#include "xspi_l.h"
#include "xspi.h"
#include "xil_printf.h"
#include "lcd.h"
#include "xbasic_types.h"
#include "xparameters.h"
#include "fft.h"
#include "stream_grabber.h"
#include "note.h"
/*****************************/

/* Define all variables and Gpio objects here  */
static XIntc sys_intctr;
static XTmrCtr sys_tmrctr;
static XTmrCtr display_tmrctr;
static XGpio encoder_gpio;
static XGpio led_gpio; 	//regular leds
static XGpio button_gpio;
/*__LCD STUFF__*/
static XGpio dc;
static XSpi spi;

XSpi_Config *spiConfig;

u32 status;
u32 controlReg;

//Globals variables
volatile unsigned int button_prev = 0;
volatile unsigned int current_state = 0b11;
volatile unsigned int button_status = 1;
volatile u32 prev_event_time = 0;

void timer_interrupt_handler(void);
void display_timer_interrupt_handler(void);

#define GPIO_CHANNEL1 1


void debounceInterrupt(void); // Write This function

void gpio_handler(void);

//...........FFT_CODE........................//
#define SAMPLES 512 // AXI4 Streaming Data FIFO has size 512
#define M 9 //2^m=samples
#define CLOCK 100000000.0 //clock speed

int int_buffer[2048];
static float q[SAMPLES];
static float w[SAMPLES];
float sample_f = 100*1000*1000/2048.0;

//float screenValues[64];// holds previously printed values to the screen
void read_fsl_values(float* q, int n) {
   int i;
   unsigned int x;
   stream_grabber_start();
   stream_grabber_wait_enough_samples(2048);

   for(i = 0; i < 2048; i++) {
         int_buffer[i] = stream_grabber_read_sample(i)>>20;
         //int_buffer[i]>>26;
         //q[i] = 3.3*x/67108864.0; // 3.3V and 2^26 bit precision.
      }
   //xil_printf("%d\r\n", int_buffer[750]);
   int idx = 0;
   for(i = 0; i < 2048; i += 4)
   {
	   q[idx++] = int_buffer[i] + int_buffer[i + 1] + int_buffer[i + 2] + int_buffer[i + 3];
   }

}
//.................................................//

/*..........................................................................*/
void BSP_init(void) {
	XStatus Status;
	/*_______________Internal Hardware SetUp________________*/

	/*Connects Interrupt Controller, Enables Interrupts*/
	Status = XIntc_Initialize(&sys_intctr, XPAR_INTC_0_DEVICE_ID);

	//timers
	Status = XIntc_Connect(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMER_0_INTERRUPT_INTR,
			(XInterruptHandler) timer_interrupt_handler, &sys_tmrctr);
	Status = XIntc_Connect(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMER_1_INTERRUPT_INTR,
			(XInterruptHandler) display_timer_interrupt_handler,
			&display_tmrctr);

	Status = XIntc_Start(&sys_intctr, XIN_REAL_MODE);

	XIntc_Enable(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMER_0_INTERRUPT_INTR);
	XIntc_Enable(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMER_1_INTERRUPT_INTR);

	/*Connects Interrupt for Timer, Enables Interrupts for Timer*/
	Status = XTmrCtr_Initialize(&sys_tmrctr, XPAR_AXI_TIMER_0_DEVICE_ID);
	Status = XTmrCtr_Initialize(&display_tmrctr, XPAR_AXI_TIMER_1_DEVICE_ID);

	XTmrCtr_SetOptions(&sys_tmrctr, 0, XTC_INT_MODE_OPTION);
	XTmrCtr_SetOptions(&display_tmrctr, 0,
	XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	// display timer reset
	XTmrCtr_SetResetValue(&display_tmrctr, 0, 0xFFFFFFFF - 10000000);

	/*Connects Interrupt Controller to MicroBlaze, Enables Interrupts to be received by MicroBlaze*/
	microblaze_register_handler(
			(XInterruptHandler) XIntc_DeviceInterruptHandler,
			(void*) XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID);

	/*_______________GPIO INIT________________*/

	/*Connects Interrupt Controller, Enables Interrupts to be received by MicroBlaze*/
	XGpio_Initialize(&encoder_gpio, XPAR_ENCODER_DEVICE_ID); //init encoder
	XIntc_Connect(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_ENCODER_IP2INTC_IRPT_INTR,
			(Xil_ExceptionHandler) TwistHandler, &encoder_gpio); //connect encoder
	XIntc_Enable(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_ENCODER_IP2INTC_IRPT_INTR); //enable encoder

	/*Enable Encoder*/
	XGpio_InterruptEnable(&encoder_gpio, XGPIO_IR_CH1_MASK);
	XGpio_InterruptGlobalEnable(&encoder_gpio);

	/*Enable LED lights*/
	XGpio_Initialize(&led_gpio, XPAR_AXI_GPIO_LED_DEVICE_ID);

	/*_______________LCD INIT SHIT________________*/
	status = XGpio_Initialize(&dc, XPAR_SPI_DC_DEVICE_ID);

	/* Set the direction for all signals to be outputs*/
	XGpio_SetDataDirection(&dc, 1, 0x0);

	/* Initialize the SPI driver so that it is  ready to use.*/
	spiConfig = XSpi_LookupConfig(XPAR_SPI_DEVICE_ID);
	if (spiConfig == NULL) {
		xil_printf("Can't find spi device!\n");
		return XST_DEVICE_NOT_FOUND;
	}

	status = XSpi_CfgInitialize(&spi, spiConfig, spiConfig->BaseAddress);
	if (status != XST_SUCCESS) {
		xil_printf("Initialize spi fail!\n");
		return XST_FAILURE;
	}

	/* Reset the SPI device to leave it in a known good state.*/
	XSpi_Reset(&spi);

	/*Setup the control register to enable master mode*/
	controlReg = XSpi_GetControlReg(&spi);
	XSpi_SetControlReg(&spi,
			(controlReg | XSP_CR_ENABLE_MASK | XSP_CR_MASTER_MODE_MASK) & (~XSP_CR_TRANS_INHIBIT_MASK));

	// Select 1st slave device
	XSpi_SetSlaveSelectReg(&spi, ~0x01);

	initLCD();
	clrScr();

	XTmrCtr_Start(&display_tmrctr, 0);

	/********_____Button INT____***********/
	Status = XGpio_Initialize(&button_gpio, XPAR_AXI_GPIO_BTN_DEVICE_ID);
	XIntc_Connect(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_AXI_GPIO_BTN_IP2INTC_IRPT_INTR,
			(Xil_ExceptionHandler) gpio_handler, &button_gpio);
	XGpio_InterruptEnable(&button_gpio, XGPIO_IR_CH1_MASK);
	XGpio_InterruptGlobalEnable(&button_gpio);
	XIntc_Enable(&sys_intctr,
	XPAR_MICROBLAZE_0_AXI_INTC_AXI_GPIO_BTN_IP2INTC_IRPT_INTR); //enable button

	// stuff meant for QF_Startup but here so it doesn't write over our INIT text
	setColor(222, 245, 229);
	setColorBg(188, 234, 213);
	setColorVB(200, 150, 0);
	setFont(BigFont);
	printShape(0, 0, 240, 320, &triangle);
}
/*..........................................................................*/
void QF_onStartup(void) { /* entered with interrupts locked */
	/* Enable interrupts */

	xil_printf("\n\rQF_onStartup\n"); // Comment out once you are in your complete program
	microblaze_enable_interrupts();
}

void QF_onIdle(void) { /* entered with interrupts locked */
	QF_INT_UNLOCK(); /* unlock interrupts */

	read_fsl_values(q, SAMPLES);
	int l;
    for (l=0;l<SAMPLES;l++) {w[l]=0;} // clears previous samples
    AO_tuner.freq = fft(q, w, SAMPLES, M, sample_f);
    setTuning(AO_tuner.a4_frequency + 400);
    if((AO_tuner.state == 2)||(AO_tuner.state == 3)) //if in ocatve or in tune
    {
    	if(AO_tuner.freq != 0)
    	{
    		findNote(AO_tuner.freq);
    	}
    }
    else
    {
    	printShape(100, 120, 56, 16, &triangle); //clears screen
    }

    if(AO_tuner.state == 4)//if in histogram
    {


    }
}

void gpio_handler(void) {
	int ButtonStatus = XGpio_DiscreteRead(&button_gpio, 1); // 1 == button channel
	if (ButtonStatus == 0x04) {
		QActive_postISR((QActive*) (&AO_tuner), BUTTON1);
	} else if (ButtonStatus == 0x02) {
		QActive_postISR((QActive*) (&AO_tuner), BUTTON2);
	} else if (ButtonStatus == 0x10) {
		QActive_postISR((QActive*) (&AO_tuner), BUTTON3);
	} else if (ButtonStatus == 0x01) {
		QActive_postISR((QActive*) (&AO_tuner), BUTTON4);
	} else if (ButtonStatus == 0x08) {
		QActive_postISR((QActive*) (&AO_tuner), BUTTON5);
	}
	XGpio_InterruptClear(&button_gpio, XGPIO_IR_CH1_MASK); //clears flag
}

/* Do not touch Q_onAssert */
/*..........................................................................*/
void Q_onAssert(char const Q_ROM * const Q_ROM_VAR file, int line) {
	(void) file; /* avoid compiler warning */
	(void) line; /* avoid compiler warning */
	QF_INT_LOCK()
	xil_printf("Failed: %s, %i\r\n", file, line);
	log_queue();
	for (;;) {
	}
}

/* Interrupt handler functions here.  Do not forget to include them in lab2a.h!
 To post an event from an ISR, use this template:
 QActive_postISR((QActive *)&AO_tuner, SIGNALHERE);
 Where the Signals are defined in lab2a.h  */

/******************************************************************************
 *
 * This is the interrupt handler routine for the GPIO for this example.
 *
 ******************************************************************************/

void TwistHandler(void *CallbackRef) {
	XGpio_InterruptGlobalDisable(&encoder_gpio);
	int encoder_data = XGpio_DiscreteRead(&encoder_gpio, 1);
	if ((encoder_data & 0b011) != (button_prev & 0b011)) //rotate
			{
		XTmrCtr_SetResetValue(&sys_tmrctr, 0, 0xFFFFFFFF - 20000);
		XTmrCtr_Start(&sys_tmrctr, 0);
		XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	} else if ((encoder_data & 0b100) != (button_prev & 0b100)) //button press
			{
		XTmrCtr_SetResetValue(&sys_tmrctr, 0, 0xFFFFFFFF - 2000000);
		XTmrCtr_Start(&sys_tmrctr, 0);
		XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	} else {
		XGpio_InterruptGlobalEnable(&encoder_gpio);
		XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	}
}

void debounceTwistInterrupt(volatile int enc_input) {
	switch (current_state) {
	case 1:
		switch (enc_input) {
		case 0b01:
			current_state = 5;
			break;
		case 0b10:
			current_state = 2;
			break;
		}
		break;
	case 2:
		switch (enc_input) {
		case 0b11:
			current_state = 1;
			break;
		case 0b00:
			current_state = 3;
			break;
		}
		break;
	case 3:
		switch (enc_input) {
		case 0b01:
			current_state = 4;
			break;
		case 0b10:
			current_state = 2;
			break;
		}
		break;
	case 4:
		switch (enc_input) {
		case 0b00:
			current_state = 3;
			break;
		case 0b11:
			QActive_postISR((QActive*) (&AO_tuner), ENCODER_DOWN);
			current_state = 1;
			break;
		}
		break;
	case 5:
		switch (enc_input) {
		case 0b00:
			current_state = 6;
			break;
		case 0b11:
			current_state = 1;
			break;
		}
		break;
	case 6:
		switch (enc_input) {
		case 0b10:
			current_state = 7;
			break;
		case 0b01:
			current_state = 5;
			break;
		}
		break;
	case 7:
		switch (enc_input) {
		case 0b11:
			QActive_postISR((QActive*) (&AO_tuner), ENCODER_UP);
			current_state = 1;
			break;
		case 0b00:
			current_state = 6;
			break;
		}
		break;
	}
}

void debounceInterrupt() {
	QActive_postISR((QActive *) &AO_tuner, ENCODER_CLICK);
}

/**********************************************************************************/
void timer_interrupt_handler() {
	Xuint32 ControlStatusReg;
	int encoder_data = XGpio_DiscreteRead(&encoder_gpio, 1);
	volatile int enc_input = encoder_data & 0b11;
	volatile int enc_button = encoder_data & 0b100;

	if (enc_button) {
		if (button_status) {
			QActive_postISR((QActive*) (&AO_tuner), ENCODER_CLICK);
		}
	}
	button_prev = encoder_data;
	debounceTwistInterrupt(enc_input);

	ControlStatusReg =
	XTimerCtr_ReadReg(sys_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET);
	XTmrCtr_WriteReg(sys_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET,
			ControlStatusReg |XTC_CSR_INT_OCCURED_MASK); //clear timer
	XGpio_InterruptClear(&encoder_gpio, XGPIO_IR_CH1_MASK); //clears flag
	XGpio_InterruptGlobalEnable(&encoder_gpio);
}

void display_timer_interrupt_handler() {
	if(AO_tuner.state != 4)
	QActive_postISR((QActive*) (&AO_tuner), TICK_SIG);
	Xuint32 ControlStatusReg;
	ControlStatusReg =
	XTimerCtr_ReadReg(display_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET);
	XTmrCtr_WriteReg(display_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET,
			ControlStatusReg |XTC_CSR_INT_OCCURED_MASK);
}

