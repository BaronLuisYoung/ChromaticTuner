/*
 * init.h
 *CODE USED FROM: https://github.com/Tguzman636/ECE-153A-Embedded-System/blob/main/Lab%201/Lab%201B/ece153a_lab1b_AnthonyGuzman_BlakeRussell/lab2/src/sevenSeg_main.c
 *  Created on: Oct 13, 2022
 *      Author: baron
 */

#ifndef SRC_INIT_H_
#define SRC_INIT_H_
#define RESET_VALUE 0xF4240 //10ms interrupt

#include "xparameters.h"
#include "xtmrctr.h"
#include "xintc.h"
#include "xgpio.h"
#include "timer_handler.h"
#include "CONSTANTS.h"
#include "gpio_handler.h"

void initialize();


#endif /* SRC_INIT_H_ */
