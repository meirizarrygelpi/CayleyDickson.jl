using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Quaternion(a))
end

@test begin
    a = 1
    !isreal(Quaternion(a, a, a, a))
end

@test begin
    z = random(Quaternion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Quaternion(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(Quaternion(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Quaternion(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, i: 2, j: 3, ij: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Quaternion(Binion(a, b))
    r = Quaternion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Quaternion(a, b, c)
    r = Quaternion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Quaternion{BigFloat})
    y = random(Quaternion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Quaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Binion{BigInt})
    z = random(Quaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Quaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Binion{BigInt})
    z = random(Quaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    z = random(Quaternion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    z = random(Quaternion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Quaternion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Quaternion{Rational{BigInt}})
    y = random(Quaternion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Quaternion{Rational{BigInt}})
    y = random(Quaternion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Quaternion{Rational{BigInt}})
    y = random(Quaternion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    z = random(Quaternion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Quaternion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Binion{BigInt})
    x = random(Quaternion{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    z = random(Quaternion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    z = random(Quaternion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    z = random(Quaternion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Quaternion{BigInt})
    quadrance(x) > big(0)
end

@test begin
    x = random(Quaternion{BigInt})
    y = random(Quaternion{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l == r
end

@test_throws ErrorException begin
    inv(Quaternion(0, 0.0))
end

@test_throws ErrorException begin
    random(Quaternion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Quaternion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Quaternion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Quaternion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Quaternion{BigInt})
    z == z + zero(Quaternion{BigInt})
end

@test begin
    z = random(Quaternion{BigInt})
    z == z * one(Quaternion{BigInt})
end

@test begin
    z = random(Quaternion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Quaternion{BigInt})
    z == z * one(z)
end

@test begin
    i = Quaternion(0,1)
    j = Quaternion(0,0,1)
    anti_commutator(i, j) == zero(Quaternion{Int})
end
