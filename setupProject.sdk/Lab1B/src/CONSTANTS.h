#ifndef CONSTANTS
#define CONSTANTS

#define RESET_VALUE 0xF4240 // 1*10^6 @ 100MHz = 10ms
#define BUTTON_CHANNEL 1

#include "xtmrctr.h"
#include "xintc.h"
#include "xbasic_types.h"
#include "xgpio.h"

//controllers/ driver
XTmrCtr sys_tmrctr;
XIntc sys_intctr;
XGpio sys_gpio;

u16 GlobalIntrMask;

volatile u32 dir;
volatile u32 start;
volatile int sevenSeg[6];


#endif
