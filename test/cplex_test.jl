using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    z = random(Cplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    z = random(Cplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Cplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Cplex{Rational{BigInt}})
    y = random(Cplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Cplex{Rational{BigInt}})
    y = random(Cplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Cplex{Rational{BigInt}})
    y = random(Cplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    z = random(Cplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Cplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    z = random(Cplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    z = random(Cplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    z = random(Cplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Cplex{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(Cplex{BigInt})
    y = random(Cplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Cplex(0, 0.0))
end

@test_throws ErrorException begin
    random(Cplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Cplex{Int})
end
