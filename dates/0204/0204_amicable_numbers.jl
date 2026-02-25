# ある整数の約数の和を求める
function sum_of_divisors(n::Int)
    s = 1
    for i = 2:isqrt(n)
        if n % i == 0
            s += i
            if i * i != n
                s += n ÷ i
            end
        end
    end
    return s
end

# 友愛数（自分自身を除いた約数の和が等しくなる異なる2つの自然数）を求める
function find_amicable_numbers(limit::Int)
    amicable_pairs = Tuple{Int, Int}[]
    for a = 1:limit
        b = sum_of_divisors(a)
        if a < b && sum_of_divisors(b) == a
            push!(amicable_pairs, (a, b))
        end
    end
    return amicable_pairs
end

println(find_amicable_numbers(10000))
# 2月4日は国際友愛デー