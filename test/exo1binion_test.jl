using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = Exo1Binion(Exoplex(a, b))
    r = Exo1Binion(a, 0, b, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo1Binion(a))
end

@test begin
    a = 1
    !isreal(Exo1Binion(a, a, a, a))
end

@test begin
    z = random(Exo1Binion{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Exo1Binion(a)) == a
end

@test begin
    a = 1
    b = 2
    c = 3
    l = unreal(Exo1Binion(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1Binion(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, i: 2, a: 3, ia: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo1Binion(Cplex(a, b))
    r = Exo1Binion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo1Binion(a, b, c)
    r = Exo1Binion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo1Binion{BigFloat})
    y = random(Exo1Binion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1Binion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(Exo1Binion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1Binion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(Exo1Binion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = associator(x, y, z)
    r = zero(Exo1Binion{BigInt})
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo1Binion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo1Binion{Rational{BigInt}})
    y = random(Exo1Binion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo1Binion{Rational{BigInt}})
    y = random(Exo1Binion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo1Binion{Rational{BigInt}})
    y = random(Exo1Binion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1Binion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    x = random(Exo1Binion{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    z = random(Exo1Binion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo1Binion{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Exo1Binion{BigInt})
    y = random(Exo1Binion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo1Binion(0, 0.0))
end

@test_throws ErrorException begin
    inv(Exo1Binion(0, 0, 1, 1))
end

@test_throws ErrorException begin
    inv(Exo1Binion(0, 0, 2, 1))
end

@test_throws ErrorException begin
    random(Exo1Binion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo1Binion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1Binion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1Binion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == z + zero(Exo1Binion{BigInt})
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == z * one(Exo1Binion{BigInt})
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == z * one(z)
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == cloak(cloak(z))
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == dagger(dagger(z))
end

@test begin
    z = random(Exo1Binion{BigInt})
    z == star(star(z))
end

@test begin
    z = random(Exo1Binion{BigInt})
    selfstar(z) == selfstar(selfstar(z))
end

@test begin
    z = random(Exo1Binion{BigInt})
    anti_selfstar(z) == anti_selfstar(anti_selfstar(z))
end
