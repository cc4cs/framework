#include <stdint.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef int8_t TARGET_INDEX;

#ifndef RES
#define RES
TARGET_TYPE res[size][size];
#endif

void matrix_mult()
{
	TARGET_INDEX i, j, k, tot = 0; 

	/* 
	 * If the number of columns of A is different from the b's rows number then 
	 * the multiplication can't be done 
	 

	if(columns_a != rows_b)
		return; */

	/* Iterates through the rows of A */
	for(i = 0; i < size; i++)
	{
		/* Iterates through the columns of B */
		for(k = 0; k < size; k++)
		{
			/* 
			 * Iterates through the columns of A. We need of the "tot" variable to remember 
			 * the value of an element in res array
			 */

			for(tot = 0, j = 0; j < size; j++)
				tot += (a[i][j] * b[j][k]);

			res[i][k] = tot;
		}
	}
}


void main()
{
	matrix_mult();
}
