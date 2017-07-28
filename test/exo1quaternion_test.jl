using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = Exo1Quaternion(Exo1Real(a, b))
    r = Exo1Quaternion(a, 0, 0, 0, b, 0, 0, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo1Quaternion(a))
end

@test begin
    a = 1
    !isreal(Exo1Quaternion(a, a, a, a))
end

@test begin
    z = random(Exo1Quaternion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Exo1Quaternion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Exo1Quaternion(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 6.0, ja: 7.0, (ij)a: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1Quaternion(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 6.0, ja: 7.0, (ij)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1Quaternion(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 6.0, ja: 0.0, (ij)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1Quaternion(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 0.0, ja: 0.0, (ij)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1Quaternion(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 0.0, ia: 0.0, ja: 0.0, (ij)a: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Exo1Quaternion(Quaternion(a, b, c, d))
    r = Exo1Quaternion(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo1Quaternion(Binion(a, b))
    r = Exo1Quaternion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo1Quaternion(a, b, c)
    r = Exo1Quaternion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigFloat})
    y = random(Exo1Quaternion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1Quaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1Quaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = alternatorL(x, y)
    r = zero(Exo1Quaternion{BigInt})
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = alternatorR(x, y)
    r = zero(Exo1Quaternion{BigInt})
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo1Quaternion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo1Quaternion{Rational{BigInt}})
    y = random(Exo1Quaternion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo1Quaternion{Rational{BigInt}})
    y = random(Exo1Quaternion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo1Quaternion{Rational{BigInt}})
    y = random(Exo1Quaternion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1Quaternion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Quaternion{BigInt})
    x = random(Exo1Quaternion{BigInt})
    l = commutator(a, x)
    r = zero(Exo1Quaternion{BigInt})
    l != r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    z = random(Exo1Quaternion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    quadrance(x) > big(0)
end

@test begin
    x = random(Exo1Quaternion{BigInt})
    y = random(Exo1Quaternion{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo1Quaternion(0, 0.0))
end

@test_throws ErrorException begin
    random(Exo1Quaternion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo1Quaternion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1Quaternion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1Quaternion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo1Quaternion{BigInt})
    z == z + zero(Exo1Quaternion{BigInt})
end

@test begin
    z = random(Exo1Quaternion{BigInt})
    z == z * one(Exo1Quaternion{BigInt})
end

@test begin
    z = random(Exo1Quaternion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo1Quaternion{BigInt})
    z == z * one(z)
end
