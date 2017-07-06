using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(ExoCockle(a))
end

@test begin
    a = 1
    !isreal(ExoCockle(a, a, a, a))
end

@test begin
    z = random(ExoCockle{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(ExoCockle(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, ExoCockle(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, A: 5.0, iA: 6.0, sA: 7.0, (is)A: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoCockle(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, A: 5.0, iA: 6.0, sA: 7.0, (is)A: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoCockle(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, A: 5.0, iA: 6.0, sA: 0.0, (is)A: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoCockle(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, A: 5.0, iA: 0.0, sA: 0.0, (is)A: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoCockle(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, A: 0.0, iA: 0.0, sA: 0.0, (is)A: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = ExoCockle(Cockle(a, b, c, d))
    r = ExoCockle(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = ExoCockle(Cplex(a, b))
    r = ExoCockle(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = ExoCockle(a, b, c)
    r = ExoCockle(a, b, c, 0)
    l == r
end

@test begin
    x = random(ExoCockle{BigFloat})
    y = random(ExoCockle{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoCockle{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Cockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoCockle{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Cockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = alternatorL(x, y)
    r = zero(ExoCockle{BigInt})
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = alternatorR(x, y)
    r = zero(ExoCockle{BigInt})
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(ExoCockle{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(ExoCockle{Rational{BigInt}})
    y = random(ExoCockle{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(ExoCockle{Rational{BigInt}})
    y = random(ExoCockle{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(ExoCockle{Rational{BigInt}})
    y = random(ExoCockle{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoCockle{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Cockle{BigInt})
    x = random(ExoCockle{BigInt})
    l = commutator(a, x)
    r = zero(ExoCockle{BigInt})
    l != r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    z = random(ExoCockle{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(ExoCockle{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(ExoCockle{BigInt})
    y = random(ExoCockle{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(ExoCockle(0, 0.0))
end

@test_throws ErrorException begin
    random(ExoCockle{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(ExoCockle{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoCockle{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoCockle{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(ExoCockle{BigInt})
    z == z + zero(ExoCockle{BigInt})
end

@test begin
    z = random(ExoCockle{BigInt})
    z == z * one(ExoCockle{BigInt})
end

@test begin
    z = random(ExoCockle{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(ExoCockle{BigInt})
    z == z * one(z)
end
