
#include <math.h>

#include <stdlib.h>
#include <stdio.h>
#include "mpi.h"

#define  Max(a,b) ((a)>(b)?(a):(b))
#define  Min(a,b) ((a)<(b)?(a):(b))
#define  N   (32)
#define  r 2
double   maxeps = 0.1e-7;
int itmax = 100;

double w = 0.5;

int myrank, ranksize, startrow, lastrow, nrow, add, beg = 1;
double ***A;

double relax();
void init();
double verify(); 
MPI_Request req[4];
MPI_Status status[4];
int main(int an, char **as)
{
    double eps, red_eps, s, red_s;
    MPI_Init(&an, &as);
    double tbeg = MPI_Wtime();
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &ranksize);
    MPI_Barrier(MPI_COMM_WORLD);
    
    startrow = (myrank * N) / ranksize;
    lastrow = ((myrank + 1) * N) / ranksize - 1;
    nrow = lastrow - startrow + 1;

    A = (double***)malloc((nrow + 2) * sizeof(double**));

	for (int i = 0; i < nrow + 2; i++)
	{
		A[i] = (double**)malloc(N * sizeof(double*));
		for (int j = 0; j < N; j++)
		{
			A[i][j] = (double*)malloc(N * sizeof(double));
		}
	}

    if (myrank == 0){
        add = 0;
    } else {
        add =  startrow - 1;
        if (myrank != ranksize -1){
            nrow +=1;
        }
       
    }
    
    printf("rk:%d, st:%d, ls%d, nr%d \n", myrank, startrow, lastrow,nrow);
	init();
	for(int it = 1; it <= itmax; it++)
	{
        red_eps = 0.;
		eps = relax();
        MPI_Allreduce(&eps, &red_eps, 1, MPI_DOUBLE, MPI_MAX, MPI_COMM_WORLD);
        if (myrank == 0){
            printf("it=%4i   eps=%f\n", it, red_eps);
        }
		
		if (red_eps < maxeps) break;

	}

	s = verify();

    MPI_Reduce(&s, &red_s, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    if (myrank == 0){
        printf("  S = %f\n", red_s);
    }
    double elapsedTime = MPI_Wtime() - tbeg;
    double totalTime;
    MPI_Reduce( &elapsedTime, &totalTime, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD );
    if (myrank == 0 ) {
        printf( "Total time spent in seconds id %f\n", totalTime );
    }
    MPI_Finalize();
	return 0;
}


void init()
{ 
	for(int k = beg; k < nrow; k++){
	    for(int j = 1; j < N - 1; j++){
	        for(int i = 1; i <  N - 1; i++){ 
                if (myrank != 0) {
                    A[k][j][i]= (4. + i + j + k + add);
                } else {
                    A[k][j][i]= (4. + i + j + k);
                }
                
	        }
        }
    }

} 


double relax()
{
    double eps = .0;
    if (myrank != 0){
        MPI_Irecv(&A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 1215, MPI_COMM_WORLD, &req[0]);
        MPI_Isend(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 1216, MPI_COMM_WORLD, &req[1]);
    }
    if (myrank != ranksize - 1){

        MPI_Isend(&A[nrow - 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 1215, MPI_COMM_WORLD, &req[2]);
        MPI_Irecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 1216, MPI_COMM_WORLD, &req[3]);
    }
    int ll = 4, sh = 0;
    if (myrank == 0) {
        sh = 2;
        ll = 2;
    }
    if (myrank == ranksize - 1) ll = 2;
    MPI_Waitall(ll, &req[sh], &status[0]);

	for(int k = beg; k < nrow; k++){
	    for(int j = 1; j <= N - 2; j++){
	        for(int i = 1 + ( k + add + j ) % 2; i <= N - 2; i += 2){ 
		        double b;
		        b = w * ((A[k][j][i-1] + A[k][j][i+1] + A[k][j-1][i] + A[k][j+1][i]
		            + A[k-1][j][i] + A[k+1][j][i] ) / 6. - A[k][j][i]);
		        eps =  Max(fabs(b), eps);
		        A[k][j][i] = A[k][j][i] + b;
	        }
        }
    }
    if (myrank != 0){
        MPI_Irecv(&A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 1215, MPI_COMM_WORLD, &req[0]);
        MPI_Isend(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 1216, MPI_COMM_WORLD, &req[1]);
    }
    if (myrank != ranksize - 1){
        MPI_Isend(&A[nrow - 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 1215, MPI_COMM_WORLD, &req[2]);
        MPI_Irecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 1216, MPI_COMM_WORLD, &req[3]);
    }
    if (myrank == 0) {
        sh = 2;
        ll = 2;
    }
    if (myrank == ranksize - 1) ll = 2;
    MPI_Waitall(ll, &req[sh], &status[0]);

	for(int k = beg; k < nrow; k++){
	    for(int j = 1; j <= N - 2; j++){
	        for(int i = 1 + (k + j + 1 + add ) % 2; i <= N - 2; i += 2){
		        A[k][j][i] += w * ( (A[k][j][i-1] + A[k][j][i+1] + A[k][j-1][i] + A[k][j+1][i]
		            + A[k-1][j][i] + A[k+1][j][i] ) / 6. - A[k][j][i]);
	        }
        }
    }
    return eps;

}


double verify()
{ 

	double s = 0.;

    for(int k=beg; k < nrow; k++){
	    for(int j=0; j<=N - 1; j++){
	        for(int i=0; i<=N-1; i++){
		        s = s + A[k][j][i] * (i + 1) * (j + 1) * (k+ add + 1) / (N * N * N);
	        }
        }
    }
    // printf("%f", s);
    return s;

}


