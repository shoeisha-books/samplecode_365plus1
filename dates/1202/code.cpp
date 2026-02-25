//PnumMpi.c
//使うmachineすべてでsshや固定アドレスなどの準備作業をしておく ここでは3台使うとする
//sudo apt install openmpi-bin openmpi-common libopenmpi-dev
//mpicc -o PnumMpi PnumMpi.c -fopenmp -lgmp
//mpirun --host comp0,comp1,comp2 --bind-to none -np 3 ./PnumMpi
#include <stdio.h>
#include <gmp.h>
#include <omp.h>
#include <mpi.h>
int world_size,world_rank;		// OpenMPI変数
unsigned long  N=  1000000UL;
void prnum(int i){	// PnumOmp.c と同じ	}
int main(int argc, char** argv){
    MPI_Init(&argc, &argv);
    extern int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    extern int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    int ms,me;
    if(world_rank==0){			ms=0; 	me=199;	//comp0 の性能に合わせて調整
    }else if(world_rank==1){	ms=200; me=399;	//comp1 の性能に合わせて調整
    }else if(world_rank==2){	ms=400; me=599;	//comp2 の性能に合わせて調整
    }else{	ms=0; me=0;
    }
    #pragma omp parallel for schedule(dynamic)
    for (int i = ms; i <= me; i++)	prnum(i);	// 論理cpu数<200 でも並列動作する
    MPI_Finalize();
    return 0;
}
