using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Zorn(a))
end

@test begin
    a = 1
    !isreal(Zorn(a, a, a, a))
end

@test begin
    z = random(Zorn{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Zorn(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Zorn(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 6.0, js: 7.0, (ij)s: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Zorn(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 6.0, js: 7.0, (ij)s: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Zorn(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 6.0, js: 0.0, (ij)s: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Zorn(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 0.0, js: 0.0, (ij)s: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Zorn(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 0.0, is: 0.0, js: 0.0, (ij)s: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Zorn(Hamilton(a, b, c, d))
    r = Zorn(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Zorn(Cplex(a, b))
    r = Zorn(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Zorn(a, b, c)
    r = Zorn(a, b, c, 0)
    l == r
end

@test begin
    x = random(Zorn{BigFloat})
    y = random(Zorn{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Zorn{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(Zorn{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Zorn{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(Zorn{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    z = random(Zorn{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    z = random(Zorn{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = alternatorL(x, y)
    r = zero(Zorn{BigInt})
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = alternatorR(x, y)
    r = zero(Zorn{BigInt})
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Zorn{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Zorn{Rational{BigInt}})
    y = random(Zorn{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Zorn{Rational{BigInt}})
    y = random(Zorn{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Zorn{Rational{BigInt}})
    y = random(Zorn{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    z = random(Zorn{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Zorn{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    x = random(Zorn{BigInt})
    l = commutator(a, x)
    r = zero(Zorn{BigInt})
    l != r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    z = random(Zorn{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    z = random(Zorn{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    z = random(Zorn{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Zorn{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Zorn{BigInt})
    y = random(Zorn{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Zorn(0, 0.0))
end

@test_throws ErrorException begin
    random(Zorn{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Zorn{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Zorn{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Zorn{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Zorn{BigInt})
    z == z + zero(Zorn{BigInt})
end

@test begin
    z = random(Zorn{BigInt})
    z == z * one(Zorn{BigInt})
end

@test begin
    z = random(Zorn{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Zorn{BigInt})
    z == z * one(z)
end
