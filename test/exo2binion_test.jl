using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    l = Exo2Binion(BiExoplex(1,2,3,4))
    r = Exo2Binion(1,0,2,0,3,0,4)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo2Binion(a))
end

@test begin
    a = 1
    !isreal(Exo2Binion(a, a, a, a))
end

@test begin
    z = random(Exo2Binion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Exo2Binion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Exo2Binion(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, a: 3.0, ia: 4.0, b: 5.0, ib: 6.0, ab: 7.0, (ia)b: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2Binion(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, a: 3.0, ia: 4.0, b: 5.0, ib: 6.0, ab: 7.0, (ia)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2Binion(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, a: 3.0, ia: 4.0, b: 5.0, ib: 6.0, ab: 0.0, (ia)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2Binion(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, a: 3.0, ia: 4.0, b: 5.0, ib: 0.0, ab: 0.0, (ia)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2Binion(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, a: 3.0, ia: 4.0, b: 0.0, ib: 0.0, ab: 0.0, (ia)b: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Exo2Binion(ExoComplex(a, b, c, d))
    r = Exo2Binion(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo2Binion(Cplex(a, b))
    r = Exo2Binion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo2Binion(a, b, c)
    r = Exo2Binion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo2Binion{BigFloat})
    y = random(Exo2Binion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo2Binion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(ExoComplex{BigInt})
    z = random(Exo2Binion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo2Binion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(ExoComplex{BigInt})
    z = random(Exo2Binion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    z = random(Exo2Binion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    z = random(Exo2Binion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = alternatorL(x, y)
    r = zero(Exo2Binion{BigInt})
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = alternatorR(x, y)
    r = zero(Exo2Binion{BigInt})
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo2Binion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo2Binion{Rational{BigInt}})
    y = random(Exo2Binion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo2Binion{Rational{BigInt}})
    y = random(Exo2Binion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo2Binion{Rational{BigInt}})
    y = random(Exo2Binion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    z = random(Exo2Binion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo2Binion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(ExoComplex{BigInt})
    x = random(Exo2Binion{BigInt})
    l = commutator(a, x)
    r = zero(Exo2Binion{BigInt})
    l != r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    z = random(Exo2Binion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    z = random(Exo2Binion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    z = random(Exo2Binion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo2Binion{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Exo2Binion{BigInt})
    y = random(Exo2Binion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo2Binion(0, 0.0))
end

@test_throws ErrorException begin
    random(Exo2Binion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo2Binion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo2Binion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo2Binion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo2Binion{BigInt})
    z == z + zero(Exo2Binion{BigInt})
end

@test begin
    z = random(Exo2Binion{BigInt})
    z == z * one(Exo2Binion{BigInt})
end

@test begin
    z = random(Exo2Binion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo2Binion{BigInt})
    z == z * one(z)
end
