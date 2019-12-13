#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "omp.h"

#define  Max(a,b) ((a)>(b)?(a):(b))
#define  Min(a,b) ((a)<(b)?(a):(b))
#define  N   (1200+2)
double   maxeps = 0.1e-7;
int itmax = 100;
double w = 0.5;
double eps;

double (*A)[N][N];

void relax();
void init();
void verify(); 

int main(int an, char **as)
{
    MPI_Request req[4];
    int myrank, ranksize, startrow lastrow, nrow;
    MPI_Status status[4];
    MPI_Init(&an, &as);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &ranksize);
    MPI_Barrier(MPI_COMM_WORLD);

    startrow = (myrank * N) / ranksize;
    lastrow = ((myrank + 1) * N) / ranksize - 1;
    nrow = lastrow - startrow + 1;
    A = malloc((nrow + 2) * N * N * sizeof(double))
    
	init();
	for(int it = 1; it <= itmax; it++)
	{
		eps = 0.;
        red_eps = 0.;
		relax();
        MPI_Allreduce(&eps, &red_eps, 1, MPI_DOUBLE, MPI_MAX, MPI_COMM_WORLD);
        if (myrank == 0){
            printf("it=%4i   eps=%f\n", it, red_eps);
        }
		
		if (red_eps < maxeps) break;
	}

    double s, red_s;
	verify();
    MPI_Reduce(&s, &red_s, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);
    if (myrank == 0){
        printf("  S = %f\n", red_s);
    }
	return 0;
}


void init()
{ 
	for(int k = 1; i < Min(nrow, N - 1); i++){
	    for(int j = 1; j <  N - 1; j++){
	        for(int i = 1; k <  N - 1; k++){ 
                A[i][j][k]= (4. + i + j + k);
	        }
        }
    }
} 


void relax()
{

    if (myrank != 0){
        MPI_Sendrecv(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 
        1216, &A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 
        1215, MPI_COMM_WORLD, &req[0])
    }
    if (myrank != ranksize - 1){
        MPI_Sendrecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 
        1216, &A[nrow + 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 
        1215, MPI_COMM_WORLD, &req[1])
    }

	for(int k = 1; k <= Min(nrow, N - 2); k++){
	    for(int j = 1; j <= N - 2; j++){
	        for(int i = 1 + ( k + j ) % 2; i <= N - 2; i += 2){ 
		        double b;
		        b = w * ( (A[i-1][j][k] + A[i+1][j][k] + A[i][j-1][k] + A[i][j+1][k]
		            + A[i][j][k-1] + A[i][j][k+1] ) / 6. - A[i][j][k]);
		        eps =  Max(fabs(b), eps);
		        A[i][j][k] = A[i][j][k] + b;
	        }
        }
    }
	for(int k = 1; k <= Min(nrow, N - 2); k++){
	    for(int j = 1; j <= N - 2; j++){
	        for(int i = 1 + (k + j + 1) % 2; i <= N - 2; i += 2){
		        A[i][j][k] += w * ( (A[i - 1][j][k] + A[i + 1][j][k] + A[i][j - 1][k] + A[i][j + 1][k]
		            + A[i][j][k - 1] + A[i][j][k + 1] ) / 6. - A[i][j][k]);
	        }
        }
    }
    

}


void verify()
{ 

	s = 0.;
	for(int i = 0; i <= Min(nrow, N - 1); i++){
	    for(int j = 0; j <= N - 1; j++){
	        for(int k = 0; k <= N - 1; k++){
		        s = s + A[i][j][k] * (i + 1) * (j + 1) * (k + 1) / (N * N * N);
	        }
        }
    }


}


