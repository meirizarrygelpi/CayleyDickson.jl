using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(SplitQuaternion(a))
end

@test begin
    a = 1
    !isreal(SplitQuaternion(a, a, a, a))
end

@test begin
    z = random(SplitQuaternion{Int})
    z == +(z)
end

@test begin
    a = 1
    real(SplitQuaternion(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(SplitQuaternion(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, SplitQuaternion(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, i: 2, s: 3, is: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = SplitQuaternion(Cplex(a, b))
    r = SplitQuaternion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = SplitQuaternion(a, b, c)
    r = SplitQuaternion(a, b, c, 0)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigFloat})
    y = random(SplitQuaternion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(SplitQuaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(SplitQuaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = associator(x, y, z)
    r = zero(SplitQuaternion{BigInt})
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(SplitQuaternion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(SplitQuaternion{Rational{BigInt}})
    y = random(SplitQuaternion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(SplitQuaternion{Rational{BigInt}})
    y = random(SplitQuaternion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(SplitQuaternion{Rational{BigInt}})
    y = random(SplitQuaternion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(SplitQuaternion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    x = random(SplitQuaternion{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    z = random(SplitQuaternion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(SplitQuaternion{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(SplitQuaternion{BigInt})
    y = random(SplitQuaternion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(SplitQuaternion(0, 0.0))
end

@test_throws ErrorException begin
    inv(SplitQuaternion(1, 1, 1, 1))
end

@test_throws ErrorException begin
    inv(SplitQuaternion(1, 2, 2, 1))
end

@test_throws ErrorException begin
    random(SplitQuaternion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(SplitQuaternion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(SplitQuaternion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(SplitQuaternion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(SplitQuaternion{BigInt})
    z == z + zero(SplitQuaternion{BigInt})
end

@test begin
    z = random(SplitQuaternion{BigInt})
    z == z * one(SplitQuaternion{BigInt})
end

@test begin
    z = random(SplitQuaternion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(SplitQuaternion{BigInt})
    z == z * one(z)
end
