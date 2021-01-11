#include "mpi.h"
#include <iostream>
int myrank, ranksize;

int ranks_order[] = {0, 1, 2, 3, 7, 11, 15, 14, 10, 6, 5, 9, 13, 12, 8, 4};
int ranks_alive[16];

int get_next_rank(int my){
    if (my == 4) return 0;
    for (int t = 0; t < 16; t++){
        if (ranks_order[t] == my) return ranks_order[t+1];
    }
    return 0;
}
MPI_Request req;
MPI_Status status;
#define INITIAL_PROC 4
int main(int an, char **as)
{
    int start_rank = 4;
    int coordinator = -1; //nobody was elected
    MPI_Init(&an, &as);
    double tbeg = MPI_Wtime();
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &ranksize);
    MPI_Barrier(MPI_COMM_WORLD);

    ranks_alive[0] = myrank;
    if (myrank == INITIAL_PROC){
        MPI_Send(&myrank, 1, MPI_INT, get_next_rank(myrank), 1000, MPI_COMM_WORLD); //Election start
    }

    while(coordinator < 0){ // we must choose coordinator
        MPI_Status st;
        MPI_Probe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &st);
        int size;
        MPI_Get_count(&st, MPI_INT, &size);
        int* buf = (int*)malloc(sizeof(int) * size);
        MPI_Recv(buf, size, MPI_INT, st.MPI_SOURCE, st.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        if (st.MPI_TAG == 1000){
            for (int t = 0; t < size; t++){
                if (myrank == buf[t]){
                    coordinator = myrank;
                    break;
                }
            }
            if (coordinator >= 0){
                coordinator = myrank;
                MPI_Send(&myrank, 1, MPI_INT, get_next_rank(myrank), 2000, MPI_COMM_WORLD); //new coordinator
            } else{
                buf = (int*)realloc(buf, sizeof(int) * (size + 1));
                buf[size] = myrank;
                MPI_Send(buf, size + 1, MPI_INT, get_next_rank(myrank), 1000, MPI_COMM_WORLD);
            }

        } else if (st.MPI_TAG == 2000){
            coordinator = buf[0];
            MPI_Send(buf, 1, MPI_INT, get_next_rank(myrank), 2000, MPI_COMM_WORLD); //pass coordinator
        }

    }
    
    printf("rk: %d coord: %d\n", myrank, coordinator);
	
    MPI_Finalize();
	return 0;
}