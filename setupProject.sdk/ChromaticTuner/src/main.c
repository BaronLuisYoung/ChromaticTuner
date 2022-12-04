/*****************************************************************************
 * main.c for Lab2A of ECE 153a at UCSB
 * Date of the Last Update:  November 1,2020
 *****************************************************************************/

#include "qpn_port.h"                                       /* QP-nano port */
#include "bsp.h"                             /* Board Support Package (BSP) */
#include "lab2a.h"                               /* application interface */
#include "xil_cache.h"		                /* Cache Drivers */

static QEvent l_lab2aQueue[30];

QActiveCB const Q_ROM Q_ROM_VAR QF_active[] = {
		{ (QActive *) 0, (QEvent *) 0, 0 }, { (QActive *) &AO_tuner,
				l_lab2aQueue, Q_DIM(l_lab2aQueue) } };

Q_ASSERT_COMPILE(QF_MAX_ACTIVE == Q_DIM(QF_active) - 1);

// Do not edit main, unless you have a really good reason
int main(void) {

	Xil_ICacheInvalidate();
	Xil_ICacheEnable();
	Xil_DCacheInvalidate();
	Xil_DCacheEnable();


	BSP_init(); // inside of bsp.c, starts out empty!
	ctor(); // inside of lab2a.c
	QF_run(); // inside of qfn.c
	return 0;
}

void log_queue() {
	const QActiveCB *block = &(QF_active[1]);
	QActive *a = block->act;
	int i = a->head;
	int j = 0;
	do {
		QEvent *e = &(block->queue[i]);
		i++;
		if (i >= 30)
			i = 0;
		xil_printf("Event %i: %i\r\n", j, e->sig);
		j++;
	} while (i != a->tail);
}
