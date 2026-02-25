//PnumOmp.c
//gcc -o PnumOmp PnumOmp.c -fopenmp -lgmp
#include <stdio.h>
#include <gmp.h>
#include <omp.h>
unsigned long  N=  1000000UL;
void prnum(int i){
    char fln[20];
    sprintf(fln,"prime%03d.txt",i);
    mpz_t     nn,ed,unit;
    mpz_inits(nn,ed,unit,NULL);
    mpz_set_ui(unit,N);
    mpz_mul_ui(nn,unit,(unsigned long)i);
    mpz_add(ed,nn,unit);
    while(1){
        mpz_nextprime(nn,nn);
        if(mpz_cmp(nn,ed)>=0)	break;
        FILE *file = fopen(fln, "a");
        mpz_out_str(file,10,nn);
        fprintf(file,"\n");
        fclose(file);
    }
    mpz_clears(nn,ed,unit,NULL);
}
int main(){
    #pragma omp parallel for schedule(dynamic)
    for (int i = 0; i <= 100; i++)	prnum(i);	// 論理cpu数<100 でも並列動作する
    return 0;
}