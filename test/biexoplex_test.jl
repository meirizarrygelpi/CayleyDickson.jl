using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(BiExoplex(a))
end

@test begin
    a = 1
    !isreal(BiExoplex(a, a, a, a))
end

@test begin
    z = random(BiExoplex{Int})
    z == +(z)
end

@test begin
    a = 1
    real(BiExoplex(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(BiExoplex(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, a: 2, b: 3, ab: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = BiExoplex(Exoplex(a, b))
    r = BiExoplex(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = BiExoplex(a, b, c)
    r = BiExoplex(a, b, c, 0)
    l == r
end

@test begin
    x = random(BiExoplex{BigFloat})
    y = random(BiExoplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(BiExoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Exoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(BiExoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Exoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = associator(x, y, z)
    r = zero(BiExoplex{BigInt})
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(BiExoplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(BiExoplex{Rational{BigInt}})
    y = random(BiExoplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(BiExoplex{Rational{BigInt}})
    y = random(BiExoplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(BiExoplex{Rational{BigInt}})
    y = random(BiExoplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(BiExoplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Exoplex{BigInt})
    x = random(BiExoplex{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    z = random(BiExoplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(BiExoplex{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(BiExoplex{BigInt})
    y = random(BiExoplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(BiExoplex(0, 0.0))
end

@test_throws ErrorException begin
    inv(BiExoplex(0, 1, 1, 1))
end

@test_throws ErrorException begin
    inv(BiExoplex(0, 0, 2, 1))
end

@test_throws ErrorException begin
    random(BiExoplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(BiExoplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(BiExoplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(BiExoplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(BiExoplex{BigInt})
    z == z + zero(BiExoplex{BigInt})
end

@test begin
    z = random(BiExoplex{BigInt})
    z == z * one(BiExoplex{BigInt})
end

@test begin
    z = random(BiExoplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(BiExoplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(BiExoplex{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(BiExoplex{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(BiExoplex{BigInt})
    star(star(x)) == dagger(x)
end

@test begin
    x = random(BiExoplex{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(BiExoplex{Rational{BigInt}})
    anti_selfstar(anti_selfstar(x)) == anti_selfstar(x)
end
