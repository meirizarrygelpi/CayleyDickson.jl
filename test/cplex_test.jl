using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    promote_rule(Cplex{Int}, Float64) == Cplex{Float64}
end

@test begin
    promote_rule(Cplex{Int}, Cplex{Float64}) == Cplex{Float64}
end

@test begin
    -(1.0 - Cplex(2, 3)) == Cplex(1.0, 3.0) == Cplex(2, 3) - 1.0
end

@test begin
    1.0 + Cplex(2, 3) == Cplex(3.0, 3.0) == Cplex(2, 3) + 1.0
end

@test begin
    convert(Cplex{Float64}, 1) == Cplex(1.0, 0)
end

@test begin
    convert(Cplex{Float64}, Cplex(1,2)) == Cplex(1.0, 2.0)
end

@test begin
    convert(Cplex, 2) == Cplex(2, 0)
end

@test begin
    z = Cplex{Int}(1, 2)
    convert(Elliptic{Int}, z) == z
end

@test begin
    convert(Int, Cplex(3)) == 3
end

@test_throws InexactError begin
    convert(Int, Cplex(3,4))
end

@test begin
    length(unreal(1)) == 0
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Cplex(a))
end

@test begin
    a = 1
    !isreal(Cplex(a, a))
end

@test begin
    z = random(Cplex{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Cplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Cplex(1, 2))
    l = String(take!(io))
    r = "[1: 1, i: 2]"
    l == r
end

@test begin
    x = random(Cplex{BigFloat})
    y = random(Cplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Cplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Cplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

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

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Cplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Cplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Cplex{BigInt})
    z == z + zero(Cplex{BigInt})
end

@test begin
    z = random(Cplex{BigInt})
    z == z * one(Cplex{BigInt})
end

@test begin
    z = random(Cplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Cplex{BigInt})
    z == z * one(z)
end
