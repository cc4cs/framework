#include <stdint.h>
#include <values.h>

typedef int8_t TARGET_TYPE;
typedef int8_t TARGET_INDEX;

#ifndef NEED
#define NEED
TARGET_TYPE need[n_process][n_resources];
#endif

TARGET_INDEX i = 0;
TARGET_INDEX j = 0;

TARGET_TYPE found = 0;




TARGET_TYPE banker_algorithm()
{	
	for(i = 0; i < n_process; i++)
	{
		for(j = 0; j < n_resources; j++)
			need[i][j] = max[i][j] - allocated[i][j];
	}
	for(i = 0; i < n_process; i++)
	{
		
		for(j = 0; j < n_resources; j++)
		{

			available[j] -= need[i][j];
			allocated[i][j] += need[i][j];
			
			found = 0;

			if(need[i][j] <= available[j] /*&&*/ 
				/*need[i][j] >= 0 */ )
			{
				available[j] += allocated[i][j];
				found = 1;
			}

			if(found == 0)
				return -1;
		}

	}

	return 1;
}


void main()
{

	banker_algorithm(n_process, n_resources, available, allocated,max);
}
