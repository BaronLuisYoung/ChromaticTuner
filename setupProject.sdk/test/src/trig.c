#include "trig.h"
#include <xil_printf.h>
#include "trigTables.h"

//void setTrigTables() {
//	xil_printf("Starting to set trig tables\n");
//	for (int k = 0; k < 512; k++) {
//		int b = 1;
//		for (int bi = 0; bi < 10; bi++) {
//			cosTable[k][bi] = cosine(-PI*k/b);
//			sinTable[k][bi] = sine(-PI*k/b);
//			b *= 2;
//		}
//	}
//	xil_printf("Finished setting trig tables\n");
//}


void Initialize() {
	int b = 1;
	for (int r = 0; r < 512; r++)
	{
		cos_table[r][0] = 0;
		sin_table[r][0] = 0;
		for (int c = 1; c < 10; c++)
		{
			cos_table[r][c] = cosine(-PI*r/b);
			sin_table[r][c] = sine(-PI*r/b);
			b *= 2;
		}
		b = 1;
		printf("Initializing... (%d/%d)\n\r", (r+1),512);
	}

}

float op_sin(int k, int b)
{
	int count = 0;
	while (b % 2 == 0)
	{
		b /= 2;
		count++;
	}
	if (sin_table != NULL)
	{
		return sin_table[k][count+1];
	}
}

float op_cos(int k, int b)
{
	int count = 0;
	while (b % 2 == 0)
	{
		b /= 2;
		count++;
	}
	if (cos_table != NULL)
	{
		return cos_table[k][count+1];
	}
}

int factorial(int a) {
	if(a==0) return 1;
	return a*factorial(a-1);
}
 
float sine(float x) {
	if(x > (PI/2) || x < (-PI/2)){
		float d=x/2;
		return cosine(d)*sine(d)*2;
	}
	int i,j;
	float sine=0;
	float power;
	for(i=0;i<10;i++) {
		power=x;
		if(i!=0) {
			for(j=0;j<i*2;j++)
				power*=x;
		}
		if(i%2==1)
			power*=-1;
		sine+=power/factorial(2*i+1);
	}
	return sine;
}

float cosine(float x){
	float c,s;
	if(x > (PI/2) || x < (-PI/2)) {
		c=cosine(x/2);
		s=sine(x/2);
		return c*c-s*s;
	}
	int i,j;
	float cosine=0;
	float power;
	for(i=0;i<10;i++) {
		if(i==0) power=1;
		else power=x;
		if(i!=0) {
			for(j=0;j<i*2-1;j++)
				power*=x;
		}
		if(i%2==1)
			power*=-1;
		cosine+=power/factorial(2*i);
	}
	return cosine;	
}
