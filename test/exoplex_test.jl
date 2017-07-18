using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exoplex(a))
end

@test begin
    a = 1
    !isreal(Exoplex(a, a))
end

@test begin
    z = random(Exoplex{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Exoplex(a)) == a
end

@test begin
    a = 1
    l = unreal(Exoplex(0, a))
    r = [a]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exoplex(1, 2))
    l = String(take!(io))
    r = "[1: 1, a: 2]"
    l == r
end

@test begin
    x = random(Exoplex{BigFloat})
    y = random(Exoplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    z = random(Exoplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    z = random(Exoplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exoplex{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(Exoplex{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(Exoplex{BigInt})
    star(star(x)) == x
end

@test begin
    x = random(Exoplex{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(Exoplex{Rational{BigInt}})
    antiselfstar(antiselfstar(x)) == antiselfstar(x)
end

@test begin
    x = random(Exoplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exoplex{Rational{BigInt}})
    y = random(Exoplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exoplex{Rational{BigInt}})
    y = random(Exoplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exoplex{Rational{BigInt}})
    y = random(Exoplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    z = random(Exoplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exoplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    z = random(Exoplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    z = random(Exoplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    z = random(Exoplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exoplex{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Exoplex{BigInt})
    y = random(Exoplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exoplex(0, 0.0))
end

@test_throws ErrorException begin
    inv(Exoplex(0, 1.0))
end

@test_throws ErrorException begin
    random(Exoplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exoplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exoplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exoplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exoplex{BigInt})
    z == z + zero(Exoplex{BigInt})
end

@test begin
    z = random(Exoplex{BigInt})
    z == z * one(Exoplex{BigInt})
end

@test begin
    z = random(Exoplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exoplex{BigInt})
    z == z * one(z)
end

@test begin
    float(Exoplex{Float64}) == Exoplex{Float64}
end
