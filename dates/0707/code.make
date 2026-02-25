# GNU Make: Pure functional Fibonacci (no shell). Usage: make N=10
N ?= 10

# Reservoir of ones (unary builder)
ONES = 1 1 1 1 1 1 1 1 1 1 \
         1 1 1 1 1 1 1 1 1 1 \
         1 1 1 1 1 1 1 1 1 1 \
         1 1 1 1 1 1 1 1 1 1 \
         1 1 1 1 1 1 1 1 1 1

# rep(k) => k copies of "1"
rep = $(wordlist 1,$1,$(ONES))

# add(a,b) => a+b  (count words after concatenation)
add = $(words $(call rep,$1) $(call rep,$2))

# dec(n) => n-1  (drop the first "1")
dec = $(words $(wordlist 2,$(words $(call rep,$1)),$(call rep,$1)))

# fib(n)
fib = $(if $(filter 0 1,$1),$1, \
         $(call add,$(call fib,$(call dec,$1)),$(call fib,$(call dec,$(call dec,$1)))))

all:
    @echo "fib($(N)) = $(call fib,$(N))