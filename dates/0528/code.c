//PnumSingle.c
//sudo apt install gcc
//sudo apt install libgmp-dev
//gcc -o PnumSigle PnumSingle.c -lgmp
#include <stdio.h>
#include <gmp.h>
unsigned long  N=  1000000UL;
void mklist(long i,mpz_t num){
    FILE *file = fopen("primelist.txt", "a");
    fprintf(file,"%ld ",i);
    mpz_out_str(file,10,num);
    fprintf(file,"\n");
    // 上3行の代わりに gmp_fprintf(file,"%ld %Zd\n",i,num); でもよい
    fclose(file);
}
int main(){
    mpz_t nn;
    mpz_init(nn);
    mpz_set_ui(nn,1UL);
    for(long i=1L;i<=N;i++){
        mpz_nextprime(nn,nn);
        mklist(i,nn);
    }
    mpz_clear(nn);
    return 0;
}