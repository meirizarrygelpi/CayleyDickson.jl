using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Cockle(a))
end

@test begin
    a = rand(Int8)
    !isreal(Cockle(a, a, a, a))
end

@test begin
    z = random(Cockle{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Cockle(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Cockle(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, i: 2, s: 3, is: 4]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Cockle(Cplex(a, b))
    r = Cockle(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Cockle(a, b, c)
    r = Cockle(a, b, c, 0)
    l == r
end

@test begin
    x = random(Cockle{BigFloat})
    y = random(Cockle{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Cockle{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(Cockle{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Cockle{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    z = random(Cockle{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = associator(x, y, z)
    r = zero(Cockle{BigInt})
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Cockle{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Cockle{Rational{BigInt}})
    y = random(Cockle{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Cockle{Rational{BigInt}})
    y = random(Cockle{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Cockle{Rational{BigInt}})
    y = random(Cockle{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Cockle{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Cplex{BigInt})
    x = random(Cockle{BigInt})
    l = a * x
    r = x * a
    l != r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    z = random(Cockle{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Cockle{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Cockle{BigInt})
    y = random(Cockle{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Cockle(0, 0.0))
end

@test_throws ErrorException begin
    inv(Cockle(1, 1, 1, 1))
end

@test_throws ErrorException begin
    inv(Cockle(1, 2, 2, 1))
end

@test_throws ErrorException begin
    random(Cockle{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Cockle{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Cockle{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Cockle{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Cockle{BigInt})
    z == z + zero(Cockle{BigInt})
end

@test begin
    z = random(Cockle{BigInt})
    z == z * one(Cockle{BigInt})
end

@test begin
    z = random(Cockle{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Cockle{BigInt})
    z == z * one(z)
end
