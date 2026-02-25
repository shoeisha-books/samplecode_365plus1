function div(ary, n)
    for i, value in ipairs(ary) do
        if n % value == 0 then return false end
    end
    return true
end

function prime()
    coroutine.yield(2)
    coroutine.yield(3)
    local p, n = {}, 5
    while true do
        if div(p, n) then
            table.insert(p, n) 
            coroutine.yield(n)
        end
        n = n + (n % 3 ~= 1 and 2 or 4) -- Luaの三項演算子
    end
end

co = coroutine.create(prime)
for i = 1, 20 do
    cont, prime = coroutine.resume(co)
    print(prime)
end