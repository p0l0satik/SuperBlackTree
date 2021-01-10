#include <fstream>
#include <iostream>
#include <string>
#include <math.h>
#include <signal.h>
#include <vector>

#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>
#include <mpi-ext.h>

#define  Max(a,b) ((a)>(b)?(a):(b))
#define  Min(a,b) ((a)<(b)?(a):(b))
#define  N   (256)
#define  r 2
double   maxeps = 0.1e-7;
int itmax = 100;

double w = 0.5;
bool error_flag = false;
int myrank, ranksize, startrow, lastrow, nrow, add, beg = 1;
double A[N][N][N];

double relax();
void init();
double verify(); 
MPI_Request req[4];
MPI_Status status[4];
MPI_Comm comm_world = MPI_COMM_WORLD;
int procs_to_spawn = 4;

static void verbose_errhandler(MPI_Comm* pcomm, int* perr, ...) {
    MPI_Comm comm = *pcomm;
    MPIX_Comm_revoke(comm);
    
    int err = *perr;
    char errstr[MPI_MAX_ERROR_STRING];
    int i, rank, comm_size, nf, len, eclass;
    MPI_Group group_c, group_f;
    int*ranks_gc, *ranks_gf;
    
    MPI_Comm_rank(comm, &rank);
    MPI_Comm_size(comm, &comm_size);
    MPIX_Comm_failure_ack(comm);
    MPIX_Comm_failure_get_acked(comm, &group_f);
    
    MPI_Group_size(group_f, &nf);
    MPI_Error_string(err, errstr, &len);
    
    printf("Rank %d / %d: Notified of error %s. %d found dead: { ",rank, comm_size, errstr, nf);
    
    ranks_gf = (int*)malloc(nf* sizeof(int));
    ranks_gc = (int*)malloc(nf* sizeof(int));
    
    MPI_Comm_group(comm, &group_c);
    
    for(i= 0; i < nf; i++)
        ranks_gf[i] = i;
    
    MPI_Group_translate_ranks(group_f, nf, ranks_gf,group_c, ranks_gc);
    
    for(i= 0; i < nf; i++)
        printf("%d ", ranks_gc[i]);
    printf("}\n");
    if (procs_to_spawn == 0){
        //an attempt to shut down if no spare processes were left to recover
        std::cout<<"No spare process left, exiting"<< std:: endl;
        MPI_Comm_free(&comm);
        free(ranks_gf); 
        free(ranks_gc);
        MPI_Finalize();
    }
    MPIX_Comm_shrink(comm, &comm_world);

    int temp = myrank; 

    MPI_Comm_rank(comm_world, &myrank);
    MPI_Comm_size(comm_world, &ranksize);
    fflush(stdout);

    int true_nf = 0;
    MPI_Allreduce(&nf, &true_nf, 1, MPI_INT, MPI_MAX, comm_world);
    procs_to_spawn -= true_nf;

    error_flag = true;
    ranksize -= procs_to_spawn;
    printf("rank: %d -> %d\n world size = %d \n", temp, myrank, ranksize);
    fflush(stdout);
    free(ranks_gf); 
    free(ranks_gc);
}

void dump(){
    if (myrank < ranksize){
        char name[100];
        sprintf(name, "matrix_%d", myrank);
        FILE *file = fopen(name, "wb");
        fwrite(&A, sizeof(double), N*N*N, file);
        
        fclose(file);
    }
}

void read_dump(){
    char name[100];
    sprintf(name, "matrix_%d", myrank);
    FILE *file = fopen(name, "rb");
    fread(&A, sizeof(double), N*N*N, file);
    
    fclose(file);
}

void calculate_rows(){
    if (myrank < ranksize){
        startrow = (myrank * N) / ranksize;
        lastrow = ((myrank + 1) * N) / ranksize - 1;
        nrow = lastrow - startrow + 1;

        if (myrank == 0){
            add = 0;
        } else {
            add =  startrow - 1;
            if (myrank != ranksize -1){
                nrow +=1;
            }
        
        }    
    }
}

int main(int an, char **as)
{
    double eps, red_eps, s, red_s;
    MPI_Init(&an, &as);

    MPI_Comm parent, intercomm;
    MPI_Comm_get_parent(&parent);
    int is_son = 0;
    if (parent == MPI_COMM_NULL) {
        MPI_Comm_spawn("./new_mpi", 
                MPI_ARGV_NULL, 
                procs_to_spawn, 
                MPI_INFO_NULL, 0, 
                comm_world, 
                &intercomm, 
                MPI_ERRCODES_IGNORE);
    } else {
        intercomm = parent;
        is_son = 1;
    }

    MPI_Intercomm_merge(intercomm, is_son, &comm_world);

    double tbeg = MPI_Wtime();
    MPI_Comm_rank(comm_world, &myrank);
    MPI_Comm_size(comm_world, &ranksize);
    ranksize -= procs_to_spawn;

    MPI_Errhandler handler;
    MPI_Comm_create_errhandler(verbose_errhandler, &handler);
    MPI_Comm_set_errhandler(comm_world, handler);

    MPI_Barrier(comm_world);
    calculate_rows();    
    
    printf("rk:%d, st:%d, ls%d, nr%d \n", myrank, startrow, lastrow,nrow);
    if (myrank < ranksize){
	    init();
    }
    int last_iter;
    std::vector<int> to_die = {39, 19, 10}; //it when 0 will die
	for(int it = 1; it <= itmax; it++)
	{

        if (error_flag){
            error_flag = false;
            calculate_rows();
            if (myrank < ranksize){
                read_dump();
            }
            it = last_iter;
            continue;
        }
        red_eps = 0.;
        if ( to_die.size() && it == to_die.back()){
            to_die.pop_back();
            if (myrank == 0)raise(SIGKILL);
        }
		eps = relax();

        if (error_flag) continue;
        MPI_Allreduce(&eps, &red_eps, 1, MPI_DOUBLE, MPI_MAX, comm_world);
        if (error_flag) continue;
        if (myrank == 0){
            printf("it=%4i   eps=%f\n", it, red_eps);
        }
		
		if (red_eps < maxeps) break;
        if (it % 5 == 0){
            dump();
            last_iter = it;
        }
	}

    if (myrank >= ranksize){
        s = 0.0;
    } else {
	    s = verify();
    }
    
    MPI_Barrier(comm_world);
    MPI_Reduce(&s, &red_s, 1, MPI_DOUBLE, MPI_SUM, 0, comm_world);
    if (myrank == 0){
        printf("  S = %f\n", red_s);
    }
    double elapsedTime = MPI_Wtime() - tbeg;
    double totalTime;
    MPI_Reduce( &elapsedTime, &totalTime, 1, MPI_DOUBLE, MPI_MAX, 0, comm_world );
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
    if (myrank >= ranksize) return eps;
    if (myrank != 0){
        MPI_Irecv(&A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 1215, comm_world, &req[0]);
        if (error_flag) return .0;
        MPI_Isend(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 1216, comm_world, &req[1]);
        if (error_flag) return .0;
    }

    if (myrank != ranksize - 1){

        MPI_Isend(&A[nrow - 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 1215, comm_world, &req[2]);
        if (error_flag) return .0;
        MPI_Irecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 1216, comm_world, &req[3]);
        if (error_flag) return .0;
    }
    int ll = 4, sh = 0;
    if (myrank == 0) {
        sh = 2;
        ll = 2;
    }
    if (myrank == ranksize - 1) ll = 2;
    MPI_Waitall(ll, &req[sh], &status[0]);
    if (error_flag) return .0;

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
        MPI_Irecv(&A[0][0][0], N * N, MPI_DOUBLE, myrank - 1, 1215, comm_world, &req[0]);
        if (error_flag) return .0;
        MPI_Isend(&A[1][0][0], N * N, MPI_DOUBLE, myrank - 1, 1216, comm_world, &req[1]);
        if (error_flag) return .0;
    }
    if (myrank != ranksize - 1){
        MPI_Isend(&A[nrow - 1][0][0], N * N, MPI_DOUBLE, myrank + 1, 1215, comm_world, &req[2]);
        if (error_flag) return .0;
        MPI_Irecv(&A[nrow][0][0], N * N, MPI_DOUBLE, myrank + 1, 1216, comm_world, &req[3]);
        if (error_flag) return .0;
    }
    if (myrank == 0) {
        sh = 2;
        ll = 2;
    }
    if (myrank == ranksize - 1) ll = 2;
    MPI_Waitall(ll, &req[sh], &status[0]);
    if (error_flag) return .0;

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
    return s;
}

