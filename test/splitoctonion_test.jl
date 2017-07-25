using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(SplitOctonion(a))
end

@test begin
    a = 1
    !isreal(SplitOctonion(a, a, a, a))
end

@test begin
    z = random(SplitOctonion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(SplitOctonion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, SplitOctonion(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 6.0, js: 7.0, (ij)s: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, SplitOctonion(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 6.0, js: 7.0, (ij)s: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, SplitOctonion(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 6.0, js: 0.0, (ij)s: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, SplitOctonion(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 5.0, is: 0.0, js: 0.0, (ij)s: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, SplitOctonion(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, s: 0.0, is: 0.0, js: 0.0, (ij)s: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = SplitOctonion(Hamilton(a, b, c, d))
    r = SplitOctonion(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = SplitOctonion(Cplex(a, b))
    r = SplitOctonion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = SplitOctonion(a, b, c)
    r = SplitOctonion(a, b, c, 0)
    l == r
end

@test begin
    x = random(SplitOctonion{BigFloat})
    y = random(SplitOctonion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(SplitOctonion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(SplitOctonion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(SplitOctonion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(SplitOctonion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    z = random(SplitOctonion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    z = random(SplitOctonion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = alternatorL(x, y)
    r = zero(SplitOctonion{BigInt})
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = alternatorR(x, y)
    r = zero(SplitOctonion{BigInt})
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(SplitOctonion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(SplitOctonion{Rational{BigInt}})
    y = random(SplitOctonion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(SplitOctonion{Rational{BigInt}})
    y = random(SplitOctonion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(SplitOctonion{Rational{BigInt}})
    y = random(SplitOctonion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    z = random(SplitOctonion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(SplitOctonion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    x = random(SplitOctonion{BigInt})
    l = commutator(a, x)
    r = zero(SplitOctonion{BigInt})
    l != r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    z = random(SplitOctonion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    z = random(SplitOctonion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    z = random(SplitOctonion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(SplitOctonion{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(SplitOctonion{BigInt})
    y = random(SplitOctonion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(SplitOctonion(0, 0.0))
end

@test_throws ErrorException begin
    random(SplitOctonion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(SplitOctonion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(SplitOctonion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(SplitOctonion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(SplitOctonion{BigInt})
    z == z + zero(SplitOctonion{BigInt})
end

@test begin
    z = random(SplitOctonion{BigInt})
    z == z * one(SplitOctonion{BigInt})
end

@test begin
    z = random(SplitOctonion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(SplitOctonion{BigInt})
    z == z * one(z)
end
