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
#include <stdlib.h> // itoa
#include "lcd.h"
int returnOne() {
	return 2;
}

/* Setup state machines */
/**********************************************************************/
static QState initial(tuner *me);
static QState on(tuner *me);
static QState main_menu(tuner *me);
static QState tune(tuner *me);
static QState octave(tuner *me);
static QState waiting(tuner *me); // waits 2s for inactivity
static QState clear(tuner *me); // clears things after 2s
static QState histogram(tuner *me);
/**********************************************************************/

tuner AO_tuner;

void ctor(void) {
	xil_printf("ctor\r\n");
	tuner *me = &AO_tuner;
	me->a4_frequency = 40;
	me->A4_ON_SCREEN = 0;
	me->clear = 1;
	me->state = 0;
	me->octave = 4;
	me->time = 0;
	me->freq = 0;
	QActive_ctor(&me->super, (QStateHandler )&initial);

}

QState initial(tuner *me) {
	xil_printf("initial\r\n");
	return Q_TRAN(&on);
}

QState on(tuner *me) {
	switch (Q_SIG(me)) {
	case Q_ENTRY_SIG:
	{
		xil_printf("enter - on\r\n");
		return Q_HANDLED();
	}
	case Q_INIT_SIG:
	{
		return Q_TRAN(&main_menu);
	}
	case Q_EXIT_SIG:
	{
		xil_printf("exit - on\r\n");
		return Q_HANDLED();
	}
	case TICK_SIG:
	{
		return Q_HANDLED();
	}
	case ENCODER_UP: {
		me->time = 0;
		char hz[2];
		itoa(me->a4_frequency, hz, 10);
		char* str0 = "A4 = 4  Hz";
		if (me->a4_frequency <= 60)
		{
			lcdPrint(str0, 45, 100);
			lcdPrint(hz, 142, 100);
			me->a4_frequency++;
		}
		me->A4_ON_SCREEN = 1;
		me->clear = 0;
		return Q_TRAN(&waiting);
	}
	case ENCODER_DOWN: {
		me->time = 0;
		char hz[2];
		itoa(me->a4_frequency, hz, 10);
		char* str0 = "A4 = 4  Hz";
		if (me->a4_frequency >= 20)
		{
			lcdPrint(str0, 45, 100);
			lcdPrint(hz, 142, 100);
			me->a4_frequency--;
		}
		me->A4_ON_SCREEN = 1;
		me->clear = 0;
		return Q_TRAN(&waiting);
	}

	}
	return Q_SUPER(&QHsm_top);
}

QState main_menu(tuner *me) {
	switch (Q_SIG(me)) {

	case Q_ENTRY_SIG:
	{
		xil_printf("enter - main_menu\r\n");
		me->state = 1;
		setFont(BigFont);
		char* str2 = "Tune";
		lcdPrint(str2, 89, 170);
		char* str3 = "Octave";
		lcdPrint(str3, 75, 200);
		char* str1 = "Histogram";
		lcdPrint(str1, 49, 230);
		return Q_HANDLED();
	}
	case Q_EXIT_SIG:
	{
		xil_printf("exit - main_menu\r\n");
		if (me->clear) // guard to not clear if doing a waiting transition
		{
			printShape(89, 170, 65, 16, &triangle); //clears tune button
			printShape(75, 200, 96, 16, &triangle); //clears octave setting
			printShape(49, 230, 160, 16, &triangle); //clears octave setting
		}
		return Q_HANDLED();
	}
	case TICK_SIG:
	{
		return Q_HANDLED();
	}
	case BUTTON4:
	{
		return Q_TRAN(&tune);
	}
	case BUTTON3:
	{
		return Q_TRAN(&octave);
	}
	case BUTTON5:
	{
		return Q_TRAN(&histogram);
	}

	}
	return Q_SUPER(&on);
}

QState tune(tuner *me) {
	switch (Q_SIG(me)) {

	case Q_ENTRY_SIG:
	{
		me->A4_ON_SCREEN = 1;
		me->state = 2;
		xil_printf("enter - tune\r\n");
		return Q_HANDLED();
	}
	case Q_EXIT_SIG:
	{
		me->A4_ON_SCREEN = 0;
		xil_printf("exit - tune\r\n");
		if(me->clear)
		{
		printShape(100, 120, 56, 16, &triangle); //clears note reading
		printShape(116, 136, 16, 16, &triangle); //clear octave
		}
		return Q_HANDLED();
	}
	case TICK_SIG:
	{
		return Q_HANDLED();
	}
	case ENCODER_CLICK:
	{
		return Q_TRAN(&main_menu);
	}

	}
	return Q_SUPER(&on);
}

QState octave(tuner *me) {
	switch (Q_SIG(me)) {
	case Q_ENTRY_SIG:
	{
		me->A4_ON_SCREEN = 1;
		me->state = 3;
		xil_printf("enter - octave\r\n");
		char* str1 = "Octave:";
		char* str2 = "< >";
		lcdPrint(str1, 64, 5);
		lcdPrint(str2, 98, 26);
		char octave_num[2];
		itoa(me->octave, octave_num, 10);
		lcdPrint(octave_num, 113, 26);
		char* str0 = "";
		itoa((int)(me->a4_frequency),str0,10);
		lcdPrint(str0, 100, 120);
		return Q_HANDLED();
	}
	case Q_EXIT_SIG:
	{
		me->A4_ON_SCREEN = 0;
		xil_printf("exit - octave\r\n");
		if(me->clear)
		{
			printShape(64, 5, 113, 40, &triangle); //clears title reading
			printShape(100, 120, 56, 16, &triangle); //clears note reading
			printShape(116, 136, 16, 16, &triangle); //clears octave #

		}
		return Q_HANDLED();
	}
	case TICK_SIG:
	{
		return Q_HANDLED();
	}
	case ENCODER_CLICK:
	{
		return Q_TRAN(&main_menu);
	}
	case BUTTON2:
	{
		if (me->octave > 2)
		{
		char octave_num[2];
		me->octave--;
		itoa(me->octave, octave_num, 10);
		lcdPrint(octave_num, 113, 26);
		}
		return Q_HANDLED();
	}
	case BUTTON1:
	{
		if (me->octave < 7)
		{
		char octave_num[2];
		me->octave++;
		itoa(me->octave, octave_num, 10);
		lcdPrint(octave_num, 113, 26);
		}
		return Q_HANDLED();
	}

	}
	return Q_SUPER(&on);
}

QState waiting(tuner *me) {
	switch (Q_SIG(me)) {
	case Q_ENTRY_SIG:
	{
		me->clear = 1;
		xil_printf("enter - waiting\r\n");
		me->time = 0;
		return Q_HANDLED();
	}
	case Q_EXIT_SIG:
	{
		xil_printf("exit - waiting\r\n");
		return Q_HANDLED();
	}
	case TICK_SIG: {
		me->time++;
		if (me->time > 20) {
			return Q_TRAN(&clear);
		}
		return Q_HANDLED();
	}
	}
	return Q_SUPER(&on);
}

QState clear(tuner *me) {
	switch (Q_SIG(me)) {
	case Q_ENTRY_SIG: {
		xil_printf("enter - clear\r\n");
		if(me->A4_ON_SCREEN)
		{
			printShape(45, 100, 160, 16, &triangle); //clears A4 setting
			me->A4_ON_SCREEN = 0;
		}
		return Q_HANDLED();
	}
	case Q_EXIT_SIG: {
		xil_printf("exit - clear\r\n");
		return Q_HANDLED();
	}

	}
	if (me->state == 1) // ghetto thing to not get stuck
	{
		return Q_SUPER(&main_menu);
	}
	else if (me->state == 2)
	{
		return Q_SUPER(&tune);
	}
	else if (me->state == 3)
	{
		return Q_SUPER(&octave);
	}
	return Q_SUPER(&on);
}

QState histogram(tuner *me) {
	switch (Q_SIG(me)) {

	case Q_ENTRY_SIG:
	{
		me->state = 4;
		xil_printf("enter - histogram\r\n");
		return Q_HANDLED();
	}
	case Q_EXIT_SIG:
	{
		return Q_HANDLED();
	}
	case TICK_SIG:
	{
		return Q_HANDLED();
	}
	case ENCODER_CLICK:
	{
		return Q_TRAN(&main_menu);
	}

	}
	return Q_SUPER(&on);
}
//export array from fft
