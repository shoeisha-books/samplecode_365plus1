lambda {

def int(n)
end

def main(v, &f)
    f.call
end

void = 0

### C言語のコード

# include <stdio.h>

int main(void) {
    printf("hello, world!\n");
    return 0;
}

###

}.call