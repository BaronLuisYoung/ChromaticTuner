/*****************************************************************************
* lab2a.h for Lab2A of ECE 153a at UCSB
* Date of the Last Update:  October 23,2014
*****************************************************************************/

#ifndef lab2a_h
#define lab2a_h

enum Lab2ASignals {
	ENCODER_UP = Q_USER_SIG,
	ENCODER_DOWN,
	ENCODER_CLICK,
	BUTTON1,
	BUTTON2,
	BUTTON3,
	BUTTON4,
	BUTTON5,
	TICK_SIG
};

typedef struct Lab2ATag {               //Lab2A State machine
	QActive super;
	int a4_frequency;
	int A4_ON_SCREEN;
	int clear;
	int state;
	int octave;
	int time;
	float freq;
} tuner;


extern struct Lab2ATag AO_tuner;


void ctor(void);
void GpioHandler(void *CallbackRef);
void TwistHandler(void *CallbackRef);

void timer_interrupt_handler();

#endif  
