using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    l = BiExoComplex(BiExoplex(1,2,3,4))
    r = BiExoComplex(1,0,2,0,3,0,4)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(BiExoComplex(a))
end

@test begin
    a = 1
    !isreal(BiExoComplex(a, a, a, a))
end

@test begin
    z = random(BiExoComplex{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(BiExoComplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, BiExoComplex(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, A: 3.0, iA: 4.0, B: 5.0, iB: 6.0, AB: 7.0, (iA)B: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoComplex(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, A: 3.0, iA: 4.0, B: 5.0, iB: 6.0, AB: 7.0, (iA)B: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoComplex(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, A: 3.0, iA: 4.0, B: 5.0, iB: 6.0, AB: 0.0, (iA)B: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoComplex(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, A: 3.0, iA: 4.0, B: 5.0, iB: 0.0, AB: 0.0, (iA)B: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoComplex(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, A: 3.0, iA: 4.0, B: 0.0, iB: 0.0, AB: 0.0, (iA)B: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = BiExoComplex(ExoComplex(a, b, c, d))
    r = BiExoComplex(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = BiExoComplex(Cplex(a, b))
    r = BiExoComplex(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = BiExoComplex(a, b, c)
    r = BiExoComplex(a, b, c, 0)
    l == r
end

@test begin
    x = random(BiExoComplex{BigFloat})
    y = random(BiExoComplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(BiExoComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(ExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(BiExoComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(ExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = alternatorL(x, y)
    r = zero(BiExoComplex{BigInt})
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = alternatorR(x, y)
    r = zero(BiExoComplex{BigInt})
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(BiExoComplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(BiExoComplex{Rational{BigInt}})
    y = random(BiExoComplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(BiExoComplex{Rational{BigInt}})
    y = random(BiExoComplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(BiExoComplex{Rational{BigInt}})
    y = random(BiExoComplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(BiExoComplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(ExoComplex{BigInt})
    x = random(BiExoComplex{BigInt})
    l = commutator(a, x)
    r = zero(BiExoComplex{BigInt})
    l != r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    z = random(BiExoComplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(BiExoComplex{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(BiExoComplex{BigInt})
    y = random(BiExoComplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(BiExoComplex(0, 0.0))
end

@test_throws ErrorException begin
    random(BiExoComplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(BiExoComplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(BiExoComplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(BiExoComplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(BiExoComplex{BigInt})
    z == z + zero(BiExoComplex{BigInt})
end

@test begin
    z = random(BiExoComplex{BigInt})
    z == z * one(BiExoComplex{BigInt})
end

@test begin
    z = random(BiExoComplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(BiExoComplex{BigInt})
    z == z * one(z)
end
