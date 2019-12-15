#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include "mpi.h"

#define  Max(a,b) ((a)>(b)?(a):(b))
#define  Min(a,b) ((a)<(b)?(a):(b))
#define  N   (8)
#define  r 0
double   maxeps = 0.1e-7;
int itmax = 1;

double w = 0.5;

int myrank, ranksize, startrow, lastrow, nrow, add;
double (*A)[N][N];

double relax();
void init();
double verify(); 
MPI_Request req[4];
MPI_Status status[4];
int main(int an, char **as)
{
    double eps, red_eps, s, red_s;
    MPI_Init(&an, &as);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &ranksize);
    MPI_Barrier(MPI_COMM_WORLD);
    
    startrow = (myrank * N) / ranksize;
    lastrow = ((myrank + 1) * N) / ranksize - 1;
    nrow = lastrow - startrow + 1;
    A = malloc((nrow + 2) * N * N * sizeof(double));
    printf("rk:%d, st:%d, ls%d, nr%d \n", myrank, startrow, lastrow,nrow);
    if (myrank == 0){
        add = 0;
    } else {
        add =  startrow - 1;
    }
	init();
	for(int it = 1; it <= itmax; it++)
	{
		// eps = 0.;
        red_eps = 0.;
		eps = relax();
        // printf("%f \n", eps);
        MPI_Allreduce(&eps, &red_eps, 1, MPI_DOUBLE, MPI_MAX, MPI_COMM_WORLD);
        if (myrank == 0){
            printf("it=%4i   eps=%f\n", it, red_eps);
        }
		
		if (red_eps < maxeps) break;

	}

	s = verify();
        // printf("rk%d  S = %f\n", myrank, s);

    MPI_Reduce(&s, &red_s, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    if (myrank == 0){
        // printf("  S = %f\n", red_s);
    }
    MPI_Finalize();
	return 0;
}


void init()
{ 
    // A[3][10][10];
    printf("fff \n");
	for(int k = 1; k < Min(nrow, N - 2); k++){
	    for(int j = 1; j < N - 2; j++){
	        for(int i = 1; i <  N - 2; i++){ 
                if (myrank != 0) {
                    A[k][j][i]= (4. + i + j + k + add);
                } else {
                    A[k][j][i]= (4. + i + j + k);
                }
                
	        }
        }
    }
    printf("vishel \n");
} 


double relax()
{
    printf("rank =%d  rs%d\n", myrank, ranksize);
    double eps = .0;
    if (myrank != 0){
        printf("%dA \n", myrank);
        MPI_Irecv(&A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 1215, MPI_COMM_WORLD, &req[0]);
        MPI_Isend(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 1216, MPI_COMM_WORLD, &req[1]);
    }
    if (myrank != ranksize - 1){
        printf("%dB \n", myrank);
        MPI_Isend(&A[nrow - 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 1215, MPI_COMM_WORLD, &req[2]);
        MPI_Irecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 1216, MPI_COMM_WORLD, &req[3]);
    }
    int ll = 4, sh = 0;
    if (myrank == 0) {
        sh = 2;
        ll = 2;
    }
    if (myrank == ranksize - 1) ll = 2;
    MPI_Status st;
    MPI_Waitall(ll, &req[sh], &st);

    

	// for(int k = 1; k <nrow; k++){
	//     for(int j = 1; j <= N - 2; j++){
	//         for(int i = 1 + ( k + add + j ) % 2; i <= N - 2; i += 2){ 
	// 	        double b;
	// 	        b = w * ((A[k][j][i-1] + A[k][j][i+1] + A[k][j-1][i] + A[k][j+1][i]
	// 	            + A[k-1][j][i] + A[k+1][j][i] ) / 6. - A[k][j][i]);
    //             // if (myrank == r) {
    //                 // printf(" rk:%d b = %f\n", myrank, b);
    //             // }
	// 	        eps =  Max(fabs(b), eps);
	// 	        A[k][j][i] = A[k][j][i] + b;
	//         }
    //     }
    // }
    // printf("ffddddf");
    // if (myrank != 0){
    //     MPI_Irecv(&A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 1215, MPI_COMM_WORLD, &req[0]);
    //     MPI_Isend(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 1216, MPI_COMM_WORLD, &req[1]);
    // }
    // if (myrank != ranksize - 1){
    //     MPI_Isend(&A[nrow - 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 1215, MPI_COMM_WORLD, &req[2]);
    //     MPI_Irecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 1216, MPI_COMM_WORLD, &req[3]);
    // }
    // if (myrank == 0) {
    //     sh = 2;
    //     ll = 2;
    // }
    // if (myrank == ranksize - 1) ll = 2;
    // MPI_Waitall(ll, &req[sh], &st);

	// for(int k = 1; k < nrow; k++){
	//     for(int j = 1; j <= N - 2; j++){
	//         for(int i = 1 + (k + j + 1 + add ) % 2; i <= N - 2; i += 2){
	// 	        A[k][j][i] += w * ( (A[k][j][i-1] + A[k][j][i+1] + A[k][j-1][i] + A[k][j+1][i]
	// 	            + A[k-1][j][i] + A[k+1][j][i] ) / 6. - A[k][j][i]);
	//         }
    //     }
    // }
    return eps;

}


double verify()
{ 

	double s = 0.;

    for(int k=1; k < nrow; k++){
	    for(int j=0; j<=N - 1; j++){
	        for(int i=0; i<=N-1; i++){
		        s = s + A[k][j][i] * (i + 1) * (j + 1) * (k+ add + 1) / (N * N * N);
	        }
        }
    }
    // if (myrank == r) {
    //     for(int k = 0; k <= Min(nrow, N - 1); k++){
    //         for(int j = 0; j <=  N - 1; j++){
    //             for(int i = 0; i <=  N - 1; i++){ 
    //                 printf("%f ", A[k][j][i]);
    //             }
    //             printf("\n");
    //         }
    //         printf("\n");
    //         printf("\n");
    //     }
    // }

    // printf("  localS = %f\n", s);
    return s;

}


