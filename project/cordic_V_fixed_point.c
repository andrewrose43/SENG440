//Derived from Mihai Sima's "Lesson 101: CORDIC" slideshow
//Copyright 2017 Mihai Sima

int z_table[16]; //array grows to include dummy value and accommodate preemptive loading

void cordic_V_fixed_point(int *x, int *y, int *z){

	//SETUP
	register int x_tmp_1, y_tmp, z_tmp;
	register int x_tmp_2;
	register int z_table_tmp; //New variable for improved pipelining
	register int i;
	
	x_tmp_1 = *x;
	y_tmp = *y;
	z_tmp = 0;

	//THE HEART OF THE CODE
	z_table_tmp  = z_table[0]; //Loading ahead of first iteration of loop
	for (i=0; i<15; i++){ //we want 15 iterations
		if (y_tmp > 0){
			x_tmp_2 = x_tmp_1 + (y_tmp >> i);
			y_tmp = y_tmp - (x_tmp_1 >> i);
			z_tmp += z_table_tmp;
		}
		else{
			x_tmp_2 = x_tmp_1 - (y_tmp >> i);
			y_tmp = y_tmp + (x_tmp_1 >> i);
			z_tmp -= z_table_tmp;
		}
		z_table_tmp = z_table[i]; //Load the value from memory ahead of when it is needed
		x_tmp_1 = x_tmp_2;
	}
	*x = x_tmp_1;
	*y = y_tmp;
	*z = z_tmp;
	//No math.h is needed, because only integers are being manipulated
}

/* Opportunities for optimization:
 * DONE - Have we enough registers to store ALL the temporary variables?
 * DONE - Get rid of y_tmp_2? It seems to have no real purpose. Could just use y_tmp_1 and save an assignment
 * DONE - Would it be possible to replace the if instruction with a predicate? -O3???
 * DONE -The z table obviously requires memory access; perhaps do this in advance of the if
 *  	-And/or in advance of the i<15 loop
 * -Load values for next iteration of loop while still in previous iteration
 * -Replace the current z_tmp load with z_table[i+1]
 *  	-You'll need a dummy/zero element in z_table to avoid pointer error
 * -Any other ideas?
 */
