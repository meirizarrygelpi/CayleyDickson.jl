using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = ExoPerplex(Exoplex(a, b))
    r = ExoPerplex(a, 0, b, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(ExoPerplex(a))
end

@test begin
    a = 1
    !isreal(ExoPerplex(a, a, a, a))
end

@test begin
    z = random(ExoPerplex{Int})
    z == +(z)
end

@test begin
    a = 1
    real(ExoPerplex(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(ExoPerplex(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoPerplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, s: 2, a: 3, sa: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = ExoPerplex(Perplex(a, b))
    r = ExoPerplex(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = ExoPerplex(a, b, c)
    r = ExoPerplex(a, b, c, 0)
    l == r
end

@test begin
    x = random(ExoPerplex{BigFloat})
    y = random(ExoPerplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Perplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Perplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = associator(x, y, z)
    r = zero(ExoPerplex{BigInt})
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(ExoPerplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(ExoPerplex{Rational{BigInt}})
    y = random(ExoPerplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(ExoPerplex{Rational{BigInt}})
    y = random(ExoPerplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(ExoPerplex{Rational{BigInt}})
    y = random(ExoPerplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoPerplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Perplex{BigInt})
    x = random(ExoPerplex{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    z = random(ExoPerplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(ExoPerplex{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) ||abs2(x) == big(0)
end

@test begin
    x = random(ExoPerplex{BigInt})
    y = random(ExoPerplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(ExoPerplex(0, 0.0))
end

@test_throws ErrorException begin
    inv(ExoPerplex(0, 0, 1, 1))
end

@test_throws ErrorException begin
    inv(ExoPerplex(1, 1, 2, 1))
end

@test_throws ErrorException begin
    random(ExoPerplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(ExoPerplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoPerplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoPerplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(ExoPerplex{BigInt})
    z == z + zero(ExoPerplex{BigInt})
end

@test begin
    z = random(ExoPerplex{BigInt})
    z == z * one(ExoPerplex{BigInt})
end

@test begin
    z = random(ExoPerplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(ExoPerplex{BigInt})
    z == z * one(z)
end
