using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = Exo1SplitBinion(Exo1Real(a, b))
    r = Exo1SplitBinion(a, 0, b, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo1SplitBinion(a))
end

@test begin
    a = 1
    !isreal(Exo1SplitBinion(a, a, a, a))
end

@test begin
    z = random(Exo1SplitBinion{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Exo1SplitBinion(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(Exo1SplitBinion(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1SplitBinion(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, s: 2, a: 3, sa: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo1SplitBinion(SplitBinion(a, b))
    r = Exo1SplitBinion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo1SplitBinion(a, b, c)
    r = Exo1SplitBinion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigFloat})
    y = random(Exo1SplitBinion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1SplitBinion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1SplitBinion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = associator(x, y, z)
    r = zero(Exo1SplitBinion{BigInt})
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo1SplitBinion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{Rational{BigInt}})
    y = random(Exo1SplitBinion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{Rational{BigInt}})
    y = random(Exo1SplitBinion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo1SplitBinion{Rational{BigInt}})
    y = random(Exo1SplitBinion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1SplitBinion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(SplitBinion{BigInt})
    x = random(Exo1SplitBinion{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    z = random(Exo1SplitBinion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) ||abs2(x) == big(0)
end

@test begin
    x = random(Exo1SplitBinion{BigInt})
    y = random(Exo1SplitBinion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo1SplitBinion(0, 0.0))
end

@test_throws ErrorException begin
    inv(Exo1SplitBinion(0, 0, 1, 1))
end

@test_throws ErrorException begin
    inv(Exo1SplitBinion(1, 1, 2, 1))
end

@test_throws ErrorException begin
    random(Exo1SplitBinion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo1SplitBinion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1SplitBinion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1SplitBinion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo1SplitBinion{BigInt})
    z == z + zero(Exo1SplitBinion{BigInt})
end

@test begin
    z = random(Exo1SplitBinion{BigInt})
    z == z * one(Exo1SplitBinion{BigInt})
end

@test begin
    z = random(Exo1SplitBinion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo1SplitBinion{BigInt})
    z == z * one(z)
end
