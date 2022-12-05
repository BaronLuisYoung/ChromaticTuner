#include "note.h"
#include "xil_printf.h"
#include "lcd.h"
#include "stdlib.h"
#include "math.h"

//array to store note names for findNote
static char notes[12][3]={"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"};
static float note_freq[12] = {65.41, 69.3, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47};

void setTuning(int a4)
{
	const float a2 = a4 / 4;
	note_freq[0] = a2 * 0.5946035575; // c2 = a2 * 2^(-9/12)
	note_freq[1] = a2 * 0.62996052494; // c#2 = a2 * 2^(-8/12)
	note_freq[2] = a2 * 0.66741992708; // d2 = a2 * 2^(-7/12)
	note_freq[3] = a2 * 0.70710678118; // d#2 = a2 * 2^(-6/12)
	note_freq[4] = a2 * 0.74915353843; // e2 = a2 * 2^(-5/12)
	note_freq[5] = a2 * 0.79370052598; // f2 = a2 * 2^(-4/12)
	note_freq[6] = a2 * 0.84089641525; // f#2 = a2 * 2^(-3/12)
	note_freq[7] = a2 * 0.89089871814; // g2 = a2 * 2^(-2/12)
	note_freq[8] = a2 * 0.94387431268; // g#2 = a2 * 2^(-1/12)
	note_freq[9] = a2;
	note_freq[10] = a2 * 1.05946309436; // a#2 = a2 * 2^(1/12)
	note_freq[11] = a2 * 1.12246204831; // b2 = a2 * 2^(2/12)
}

//finds and prints note of frequency and deviation from note
void findNote(float f) {
	float c=261.63;
	float r;
	int oct=4;
	int note=0;
	//determine which octave frequency is in
	if(f >= c) {
		while(f > c*2) {
			c=c*2;
			oct++;
		}
	}
	else { //f < C4
		while(f < c) {
			c=c/2;
			oct--;
		}
	
	}

	//find note below frequency
	//c=middle C
	r=c*root2;
	while(f > r) {
		c=c*root2;
		r=r*root2;
		note++;
	}
	// frequency = note2 * 2^oct
	// only works for notes > 2nd octave to save two shifts
	int nearest_note_freq = (int)( note_freq[note] * (1 << (oct - 2)) );
	int cents_error = (int)(1200 * log(f / nearest_note_freq) / 0.693147180);

	xil_printf("frequency: %d\r\nnearest: %d\r\n", (int)(f), nearest_note_freq);
	printShape(116, 102, 16, 32, &triangle);
	char * cents = "";
	itoa(cents_error, cents, 10);
	lcdPrint(cents, 116, 102);


	//determine which note frequency is closest to
	if((f-c) <= (r-f)) { //closer to left note
	/*	WriteString(N:");
		WriteString(notes[note]);
		WriteInt(oct);

		WriteString(" D:+");
		WriteInt((int)(f-c+.5));
		WriteString("Hz");*/
	}
	else { //f closer to right note
		note++;
		if(note >=12) note=0;
		/*WriteString("N:");
		WriteString(notes[note]);
		WriteInt(oct);
		WriteString(" D:-");
		WriteInt((int)(r-f+.5));
		WriteString("Hz");*/
	}
	char * str = "";
	int print_oct = 9;
	if (oct >= 2 && oct <= 7)
	{
		print_oct = oct;
	}
	itoa(print_oct, str, 10);
	lcdPrint(notes[note], 100, 120);
	lcdPrint(str, 116, 136);

	//lcdPrint(str, 132, 120);
	if( (note == 0) ||
		(note == 2) ||
		(note == 4) ||
		(note == 5) ||
		(note == 7) ||
		(note == 9) ||
		(note == 11))
	{
		printShape(116, 120, 16, 16, &triangle);
	}

}
