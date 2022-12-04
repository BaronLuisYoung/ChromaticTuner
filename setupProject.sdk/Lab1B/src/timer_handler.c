/*
 * timer_handler.c
 *
 *  Created on: Oct 13, 2022
 *      Author: baron
 */

#include "timer_handler.h"
//testlight
/*
#define LED 0x01
#define LED_DELAY     100000
#define LED_CHANNEL 1
*/

void clearSevenSeg()
{
	for(int i = 0; i < 6; i++)
		{
			sevenSeg[i] = 0;
		}
}

void timer_interrupt_handler()
{
	Xuint32 ControlReg = XTimerCtr_ReadReg(sys_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET); //catches interrupt writes to controlReg (cntrl, timer number, address offset)

	 // ReadReg
	    if (start == 1)
	    {
	    	if (dir == 1)
	    	{
	    		sevenSeg[0]++;
	    		for(int i = 0; i < 6; i++)
	    		{
	    			if(sevenSeg[i]> 9)
	    			{
	    				sevenSeg[i+1]++;
	    				sevenSeg[i] = 0;

	    				// check for overflow case
	    				if(sevenSeg[5] > 9)
	    				{
	    					clearSevenSeg();
	    					start = 0;
	    				}
	    			}
	    		}
	    	}
	    	else if (dir == 0)
	    	{
	    		sevenSeg[0]--;
	    		for(int i = 0; i < 6; i++)
	    		{
	    			if((sevenSeg[0] < 0) && (sevenSeg[1] == 0) && (sevenSeg[2] == 0) && (sevenSeg[3] == 0) && (sevenSeg[4] == 0) && (sevenSeg[5] == 0))
					{
						//flag = 1;
						start = 0;
						dir = 0;
						clearSevenSeg();
					}
	    			if(sevenSeg[i] < 0)
	    			{
	    				sevenSeg[i+1]--;
	    				sevenSeg[i] = 9;
	    			}
	    		}
	    	}
	    }

	XTmrCtr_WriteReg(sys_tmrctr.BaseAddress, 0, XTC_TCSR_OFFSET, ControlReg | XTC_CSR_INT_OCCURED_MASK); //acks interrupt, writes back to mem location
}
