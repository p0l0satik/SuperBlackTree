#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "omp.h"

#define  Max(a,b) ((a)>(b)?(a):(b))
#define  N   (256+2)
double   maxeps = 0.1e-7;
int itmax = 100;
double w = 0.5;
double eps;

double A [N][N][N];

void relax();
void init();
void verify(); 

int main(int an, char **as)
{
	/* int it */

	init();
#
	for(int it = 1; it <= itmax; it++)
	{
		eps = 0.;
		relax();
		printf("it=%4i   eps=%f\n", it, eps);
		if (eps < maxeps) break;
	}

	verify();

	return 0;
}


void init()
{ 
	for(int i = 0; i <= N - 1; i++){
	    for(int j = 0; j <= N - 1; j++){
	        for(int k = 0; k <= N - 1; k++){
		        if(i == 0 || i == N - 1 || j == 0 || j == N - 1 || k == 0 || k == N - 1){
                    A[i][j][k]= 0.;
                }
		        else{ 
                    A[i][j][k]= (4. + i + j + k);
                }
	        }
        }
    }
} 


void relax()
{
	
	#pragma omp parallel for ordered(3) shared(A)
	for(int k = 1; k <= N - 2; k++){
	    for(int j = 1; j <= N - 2; j++){
			int l = 1 + ( k + j ) % 2
	        for(int i = l; i <= N - 2; i += 2){ 
		        double b;
				#pragma omp ordered depend (sink: k, j, i - 1) depend (sink: k, j - 1, i ) depend (sink: k - 1, j, i)
		        b = w * ( (A[i-1][j][k] + A[i+1][j][k] + A[i][j-1][k] + A[i][j+1][k]
		            + A[i][j][k-1] + A[i][j][k+1] ) / 6. - A[i][j][k]);
		        eps =  Max(fabs(b), eps);
		        A[i][j][k] = A[i][j][k] + b;
	        }
        }
    }
	#pragma omp parallel for ordered(3) shared(A)
	for(int k = 1; k <= N - 2; k++){
	    for(int j = 1; j <= N - 2; j++){
	        for(int i = 1 + (k + j + 1) % 2; i <= N - 2; i += 2){
				#pragma omp ordered depend (sink: k, j, i - 1) depend (sink: k, j - 1, i) depend (sink: k - 1, j, i)
		        A[i][j][k] += w * ( (A[i - 1][j][k] + A[i + 1][j][k] + A[i][j - 1][k] + A[i][j + 1][k]
		            + A[i][j][k - 1] + A[i][j][k + 1] ) / 6. - A[i][j][k]);
	        }
        }
    }


}


void verify()
{ 
	double s;

	s = 0.;
	for(int i = 0; i <= N - 1; i++){
	    for(int j = 0; j <= N - 1; j++){
	        for(int k = 0; k <= N - 1; k++){
		        s = s + A[i][j][k] * (i + 1) * (j + 1) * (k + 1) / (N * N * N);
	        }
        }
    }
	printf("  S = %f\n",s);

}


