#include <stdio.h>

int add (int a, int b){
	return a+b;
}

int main(void){
	int a = 1, b = 2, c;

	c = add(a, b);
	printf("a+b=%i\n",c);
}
