using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = ExoComplex(Exoplex(a, b))
    r = ExoComplex(a, 0, b, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(ExoComplex(a))
end

@test begin
    a = 1
    !isreal(ExoComplex(a, a, a, a))
end

@test begin
    z = random(ExoComplex{Int})
    z == +(z)
end

@test begin
    a = 1
    real(ExoComplex(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(ExoComplex(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoComplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, i: 2, A: 3, iA: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = ExoComplex(Cplex(a, b))
    r = ExoComplex(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = ExoComplex(a, b, c)
    r = ExoComplex(a, b, c, 0)
    l == r
end

@test begin
    x = random(ExoComplex{BigFloat})
    y = random(ExoComplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = associator(x, y, z)
    r = zero(ExoComplex{BigInt})
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(ExoComplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(ExoComplex{Rational{BigInt}})
    y = random(ExoComplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(ExoComplex{Rational{BigInt}})
    y = random(ExoComplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(ExoComplex{Rational{BigInt}})
    y = random(ExoComplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoComplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    x = random(ExoComplex{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    z = random(ExoComplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(ExoComplex{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(ExoComplex{BigInt})
    y = random(ExoComplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(ExoComplex(0, 0.0))
end

@test_throws ErrorException begin
    inv(ExoComplex(0, 0, 1, 1))
end

@test_throws ErrorException begin
    inv(ExoComplex(0, 0, 2, 1))
end

@test_throws ErrorException begin
    random(ExoComplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(ExoComplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoComplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoComplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(ExoComplex{BigInt})
    z == z + zero(ExoComplex{BigInt})
end

@test begin
    z = random(ExoComplex{BigInt})
    z == z * one(ExoComplex{BigInt})
end

@test begin
    z = random(ExoComplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(ExoComplex{BigInt})
    z == z * one(z)
end
