#include <stdint.h>
#include <8051.h>
#include <values.h>

typedef float TARGET_TYPE;
typedef long TARGET_INDEX;

#ifndef RES
#define RES
TARGET_TYPE res[size][size];
#endif

void matrix_mul(TARGET_INDEX size, TARGET_TYPE a[size][size], TARGET_TYPE b[size][size])
{
	TARGET_INDEX i, j, k, tot = 0; 

	/* 
	 * If the number of columns of A is different from the b's rows number then 
	 * the multiplication can't be done 
	 

	if(columns_a != rows_b)
		return;*/

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

void reset_values()
{
	P0 = 0;
	P1 = 0;
	P2 = 0;
	P3 = 0;
}

void main()
{
	matrix_mul(rows_a, columns_a, a, b);
	reset_values();
}
