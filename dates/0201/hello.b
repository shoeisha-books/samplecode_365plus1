main ( ) {
    extrn putchar, printf, hi;
    putchar(hi[0]);
    putchar(hi[1]);
    putchar(hi[2]);

    auto val, i, max;
    val = 0;
    i = 1;
    max = 1000;
    while(i <= max){
        val += i;
        ++i;
    }
    printf("\ntotal:%d", val);
}

hi[3] 'H', 'i', '!';