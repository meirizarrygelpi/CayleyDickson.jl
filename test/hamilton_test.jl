using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Hamilton(a))
end

@test begin
    a = rand(Int8)
    !isreal(Hamilton(a, a, a, a))
end

@test begin
    z = random(Hamilton{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Hamilton(a)) == a
end

@test begin
    a = CayleyDickson.randomBigFloat()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigFloat()
    l = unreal(Hamilton(0, a, b, c))
    r = [a, b, c]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Hamilton(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, i: 2, j: 3, ij: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Hamilton(Cplex(a, b))
    r = Hamilton(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Hamilton(a, b, c)
    r = Hamilton(a, b, c, 0)
    l == r
end

@test begin
    x = random(Hamilton{BigFloat})
    y = random(Hamilton{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Hamilton{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(Hamilton{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Hamilton{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(Hamilton{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    z = random(Hamilton{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    z = random(Hamilton{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Hamilton{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Hamilton{Rational{BigInt}})
    y = random(Hamilton{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Hamilton{Rational{BigInt}})
    y = random(Hamilton{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Hamilton{Rational{BigInt}})
    y = random(Hamilton{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    z = random(Hamilton{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Hamilton{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    x = random(Hamilton{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    z = random(Hamilton{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    z = random(Hamilton{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    z = random(Hamilton{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Hamilton{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(Hamilton{BigInt})
    y = random(Hamilton{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Hamilton(0, 0.0))
end

@test_throws ErrorException begin
    random(Hamilton{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Hamilton{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Hamilton{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Hamilton{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Hamilton{BigInt})
    z == z + zero(Hamilton{BigInt})
end

@test begin
    z = random(Hamilton{BigInt})
    z == z * one(Hamilton{BigInt})
end

@test begin
    z = random(Hamilton{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Hamilton{BigInt})
    z == z * one(z)
end
