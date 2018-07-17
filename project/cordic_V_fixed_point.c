
//Derived from Mihai Sima's "Lesson 101: CORDIC" slideshow
//Copyright 2017 Mihai Sima

int z_table[15];

void cordic_V_fixed_point(int *x, int *y, int *z){

	//SETUP
	register int x_tmp_1, y_tmp_1, z_tmp;
	register int x_tmp_2, y_tmp_2;
	register int i;
	
	x_tmp_1 = *x;
	y_tmp_1 = *y;
	z_tmp = 0;

	//THE HEART OF THE CODE
	for (i=0; i<15; i++){ //we want 15 iterations
		if (y_tmp_1 > 0){
			x_tmp_2 = x_tmp_1 + (y_tmp_1 >> i);
			y_tmp_2 = y_tmp_1 - (x_tmp_1 >> i);
			z_tmp += z_table[i];
		}
		else{
			x_tmp_2 = x_tmp_1 - (y_tmp_1 >> i);
			y_tmp_2 = y_tmp_1 + (x_tmp_1 >> i);
			z_tmp -= z_table[i];
		}
		x_tmp_1 = x_tmp_2;
		y_tmp_1 = y_tmp_2;
	}
	*x = x_tmp_1;
	*y = y_tmp_1;
	*z = z_tmp;
	//No math.h is needed, because only integers are being manipulated
}

/* Opportunities for optimization:
 * DONE - Have we enough registers to store ALL the temporary variables?
 * -Would it be possible to replace the if instruction with a predicate?
 * -The z table obviously requires memory access; perhaps do this in advance of the if
 *  	-And/or in advance of the i<15 loop
 * -Load values for next iteration of loop while still in previous iteration
 * -Replace the current z_tmp load with z_table[i+1]
 *  	-You'll need a dummy/zero element in z_table to avoid pointer error
 * -Any other ideas?
 */
