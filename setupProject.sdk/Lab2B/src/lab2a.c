/*****************************************************************************
 * lab2a.c for Lab2A of ECE 153a at UCSB
 * Date of the Last Update:  October 23,2014
 *****************************************************************************/

#define AO_LAB2A

#include "qpn_port.h"
#include "bsp.h"
#include "lab2a.h"
#include "lcd.h"
#include "xtmrctr.h"

typedef struct Lab2ATag {               //Lab2A State machine
	QActive super;
	int volume_level;
	int VOLUME_ON_SCREEN;
	int MODE_ON_SCREEN;
	int time;
} Lab2A;

int returnOne() {
	return 2;
}

/* Setup state machines */
/**********************************************************************/
static QState Lab2A_initial(Lab2A *me);
static QState Lab2A_on(Lab2A *me);
static QState Lab2A_stateA(Lab2A *me);
static QState Lab2A_stateB(Lab2A *me);

/**********************************************************************/

Lab2A AO_Lab2A;

void Lab2A_ctor(void) {
	Lab2A *me = &AO_Lab2A;
	me->volume_level = 0;
	me->VOLUME_ON_SCREEN = 0;
	me->MODE_ON_SCREEN = 0;
	me->time = 0;
	QActive_ctor(&me->super, (QStateHandler )&Lab2A_initial);
}

QState Lab2A_initial(Lab2A *me) {
	xil_printf("Initialization\r\n");
	return Q_TRAN(&Lab2A_on);
}
QState Lab2A_on(Lab2A *me) {
	switch (Q_SIG(me)) {
	case Q_INIT_SIG: {
		return Q_TRAN(&Lab2A_stateB);
	}
	case Q_ENTRY_SIG: {
		xil_printf("Startup\r\n");
		return Q_HANDLED();
	}
	case Q_EXIT_SIG: {
		return Q_HANDLED();
	}
	case ENCODER_UP: {
		me->time = 0;
		//xil_printf("%d,",me->volume_level);
		if (me->VOLUME_ON_SCREEN) {
			printShape(24 + me->volume_level, 85, 3, 20, &returnOne);
		} else {
			printShape(24, 85, me->volume_level + 3, 20, &returnOne);
			me->VOLUME_ON_SCREEN = 1;
		}
		if (me->volume_level < 189) {
			me->volume_level += 3;
		}
		return Q_TRAN(&Lab2A_stateA);
	}
	case ENCODER_DOWN: {
		//xil_printf("%d,",me->volume_level);
		me->time = 0;
		if (me->VOLUME_ON_SCREEN) {
			printShape(21 + me->volume_level + 3, 85, 3, 20, &triangle);
		} else {
			printShape(24, 85, me->volume_level - 3, 20, &returnOne);
			me->VOLUME_ON_SCREEN = 1;
		}
		if (me->volume_level > 0) {
			me->volume_level -= 3;
		}
		return Q_TRAN(&Lab2A_stateA);
	}
	case ENCODER_CLICK: {
		xil_printf("Click\r\n");
		me->time = 0;
		if(me->VOLUME_ON_SCREEN)
		{
			printShape(24, 85, me->volume_level + 3, 20, &triangle); //clears volume
			me->VOLUME_ON_SCREEN = 0;
		} else
		{
			printShape(24, 85, me->volume_level, 20, &returnOne); //draws volume
			me->VOLUME_ON_SCREEN = 1;
		}
		return Q_TRAN(&Lab2A_stateA);
	}
	case BUTTON1: {
		me->time = 0;
		//xil_printf("\rBUTTON1\n");
		char str[6] = "Mode:1";
		lcdPrint(str, 72, 130);
		me->MODE_ON_SCREEN = 1;
		return Q_TRAN(&Lab2A_stateA);
	}
	case BUTTON2: {
		me->time = 0;
		//xil_printf("\rBUTTON2\n");
		char str[6] = "Mode:2";
		lcdPrint(str, 72, 130);
		me->MODE_ON_SCREEN = 1;
		return Q_TRAN(&Lab2A_stateA);
	}
	case BUTTON3: {
		me->time = 0;
		//xil_printf("\rBUTTON3\n");
		char str[6] = "Mode:3";
		lcdPrint(str, 72, 130);
		me->MODE_ON_SCREEN = 1;
		return Q_TRAN(&Lab2A_stateA);
	}
	case BUTTON4: {
		me->time = 0;
		//xil_printf("\rBUTTON4\n");
		char str[6] = "Mode:4";
		lcdPrint(str, 72, 130);
		me->MODE_ON_SCREEN = 1;
		return Q_TRAN(&Lab2A_stateA);
	}
	case BUTTON5: {
		me->time = 0;
		//xil_printf("\rBUTTON5\n");
		char str[6] = "Mode:5";
		lcdPrint(str, 72, 130);
		me->MODE_ON_SCREEN = 1;
		return Q_TRAN(&Lab2A_stateA);
	}

	case TICK_SIG: {
		return Q_HANDLED();
	}
	}

	return Q_SUPER(&QHsm_top);
}

/* Create Lab2A_on state and do any initialization code if needed */
/******************************************************************/

QState Lab2A_stateA(Lab2A *me) {
	switch (Q_SIG(me)) {
	case Q_ENTRY_SIG: {
		xil_printf("A\r\n");
		me->time = 0;
		return Q_HANDLED();
	}

	case Q_EXIT_SIG: {
		return Q_HANDLED();
	}
	case TICK_SIG: {
		me->time++;
		if (me->time > 200) {
			return Q_TRAN(&Lab2A_stateB);
		}
		return Q_HANDLED();
	}
	}
	return Q_SUPER(&Lab2A_on);
}

QState Lab2A_stateB(Lab2A *me) {
	switch (Q_SIG(me)) {
	case Q_ENTRY_SIG: {
		xil_printf("B\r\n");
		if(me->VOLUME_ON_SCREEN)
		{
			printShape(24, 85, me->volume_level + 3, 20, &triangle); //clears volume
			me->VOLUME_ON_SCREEN = 0;
		}
		if (me->MODE_ON_SCREEN) {
			printShape(72, 130, 100, 17, &triangle);
			me->MODE_ON_SCREEN = 0;
			me->time = 0;
		}
		return Q_HANDLED();
	}
	case Q_EXIT_SIG: {
		return Q_HANDLED();
	}

	}
	return Q_SUPER(&Lab2A_on);
}

