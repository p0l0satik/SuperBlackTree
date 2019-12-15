#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#define  Max(a,b) ((a)>(b)?(a):(b))
#define  N   (16+2)
double   maxeps = 0.1e-7;
int itmax = 100;
int i, j, k;
double w = 0.5;
double eps;

double A [N][N][N];

void relax();
void init();
void verify(); 

int main(int an, char **as)
{
	int it;

	init();

	for(it = 1; it <= itmax; it++)
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
	for(k = 1; k < N - 1; k++){
	    for(j = 1; j <= N - 2; j++){
	        for(i = 1; i <= N - 2; i++){
                    A[k][j][i]= (4. + i + j + k);
                
	        }
        }
    }
	// if (myrank == r) {
        
    // }

} 


void relax()
{

	for(k = 1; k <= N -2; k++){
	    for(j = 1; j <= N - 2; j++){
	        for(i = 1 + ( k + j ) % 2; i <= N - 2; i += 2){ 
		        double b;
		        b = w * ( (A[k][j][i-1] + A[k][j][i+1] + A[k][j-1][i] + A[k][j+1][i]
		            + A[k-1][j][i] + A[k+1][j][i] ) / 6. - 1*A[k][j][i] );
		        // printf("%f \n", b);
                eps =  Max(fabs(b), eps);
		        A[k][j][i] = A[k][j][i] + b;
	        }
        }

    }

	for(k = 1; k <= N - 2; k++){
	    for(j = 1; j <= N - 2; j++){
	        for(i = 1 + (k + j + 1) % 2; i <= N - 2; i += 2){
		        double b;
		        b = w * ( (A[k][j][i-1] + A[k][j][i+1] + A[k][j-1][i] + A[k][j+1][i]
		            + A[k-1][j][i] + A[k+1][j][i] ) / 6. -A[k][j][i]);
		        A[k][j][i] = A[k][j][i] + b;
	        }
        }
    }


}


void verify()
{ 
	double s;

	s = 0.;
	for(k=0; k<=N-1; k++){
	    for(j=0; j<=N - 1; j++){
	        for(i=0; i<=N-1; i++){
		        s = s + A[k][j][i] * (i + 1) * (j + 1) * (k + 1) / (N * N * N);
	        }
        }
    }
	// for(int k = 0; k <= N  - 1; k++){
    //         for(int j = 0; j <= N - 1; j++){
    //             for(int i = 0; i <=  N - 1; i++){ 
    //                 printf("%f ", A[k][j][i]);
    //             }
    //             printf("\n");
    //         }
    //         printf("\n");
    //         printf("\n");
    //     }
	printf("  S = %f\n",s);

}


