#include <stdio.h>
#include <math.h>

//This script computes fifteen elementary angles for CORDIC.
//The elementary angles are the fifteen largest angles z_i = arctan(2^-i)
//This script only needed to be run once.
//The output values were then manually added to the main C code.
//Derived from Mihai Sima's "Lesson 101: CORDIC" slideshow
//Copyright 2017 Mihai Sima
int main(void){
	printf("\nThe angle table:\n");
	for (int i = 0; i < 15; i++){
		printf("x[%2i] = %i\n", i,
			(int)(atan( pow(2.0, (double)(-i)))*(1<<15)));
	}
}
