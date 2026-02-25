main ( ) {
    extrn v, size, printf;
    auto i, j, temp;
    i = 0;
    while (i < (size - 1)) {
        j = i + 1;
        while (j < size) {
            if (v[i] > v[j])
            {
                temp = v[i]; v[i] = v[j]; v[j] = temp;
            }
            ++j;
        }
        ++i;
    }
    i = 0;
    while(i < size){
        printf("%d,", v[i]);
        ++i;
    }
}

size 10;
v[size] 7, 5, 3, 8, 6, 10, 2, 9, 4, 1;
