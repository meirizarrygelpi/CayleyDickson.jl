using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo2Real(a))
end

@test begin
    a = 1
    !isreal(Exo2Real(a, a, a, a))
end

@test begin
    z = random(Exo2Real{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Exo2Real(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(Exo2Real(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2Real(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, a: 2, b: 3, ab: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo2Real(Exo1Real(a, b))
    r = Exo2Real(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo2Real(a, b, c)
    r = Exo2Real(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo2Real{BigFloat})
    y = random(Exo2Real{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo2Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Exo1Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo2Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Exo1Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = associator(x, y, z)
    r = zero(Exo2Real{BigInt})
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo2Real{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo2Real{Rational{BigInt}})
    y = random(Exo2Real{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo2Real{Rational{BigInt}})
    y = random(Exo2Real{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo2Real{Rational{BigInt}})
    y = random(Exo2Real{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo2Real{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Exo1Real{BigInt})
    x = random(Exo2Real{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    z = random(Exo2Real{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo2Real{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Exo2Real{BigInt})
    y = random(Exo2Real{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo2Real(0, 0.0))
end

@test_throws ErrorException begin
    inv(Exo2Real(0, 1, 1, 1))
end

@test_throws ErrorException begin
    inv(Exo2Real(0, 0, 2, 1))
end

@test_throws ErrorException begin
    random(Exo2Real{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo2Real{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo2Real{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo2Real{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo2Real{BigInt})
    z == z + zero(Exo2Real{BigInt})
end

@test begin
    z = random(Exo2Real{BigInt})
    z == z * one(Exo2Real{BigInt})
end

@test begin
    z = random(Exo2Real{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo2Real{BigInt})
    z == z * one(z)
end

@test begin
    x = random(Exo2Real{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(Exo2Real{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(Exo2Real{BigInt})
    star(star(x)) == dagger(x)
end

@test begin
    x = random(Exo2Real{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(Exo2Real{Rational{BigInt}})
    anti_selfstar(anti_selfstar(x)) == anti_selfstar(x)
end
