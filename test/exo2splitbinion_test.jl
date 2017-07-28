using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    l = Exo2SplitBinion(Exo2Real(1,2,3,4))
    r = Exo2SplitBinion(1,0,2,0,3,0,4)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo2SplitBinion(a))
end

@test begin
    a = 1
    !isreal(Exo2SplitBinion(a, a, a, a))
end

@test begin
    z = random(Exo2SplitBinion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Exo2SplitBinion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Exo2SplitBinion(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 6.0, ab: 7.0, (sa)b: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2SplitBinion(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 6.0, ab: 7.0, (sa)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2SplitBinion(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 6.0, ab: 0.0, (sa)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2SplitBinion(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 0.0, ab: 0.0, (sa)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo2SplitBinion(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 0.0, sb: 0.0, ab: 0.0, (sa)b: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Exo2SplitBinion(Exo1SplitBinion(a, b, c, d))
    r = Exo2SplitBinion(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo2SplitBinion(SplitBinion(a, b))
    r = Exo2SplitBinion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo2SplitBinion(a, b, c)
    r = Exo2SplitBinion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigFloat})
    y = random(Exo2SplitBinion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo2SplitBinion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Exo1SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo2SplitBinion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Exo1SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = alternatorL(x, y)
    r = zero(Exo2SplitBinion{BigInt})
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = alternatorR(x, y)
    r = zero(Exo2SplitBinion{BigInt})
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo2SplitBinion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{Rational{BigInt}})
    y = random(Exo2SplitBinion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{Rational{BigInt}})
    y = random(Exo2SplitBinion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo2SplitBinion{Rational{BigInt}})
    y = random(Exo2SplitBinion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo2SplitBinion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Exo1SplitBinion{BigInt})
    x = random(Exo2SplitBinion{BigInt})
    l = commutator(a, x)
    r = zero(Exo2SplitBinion{BigInt})
    l != r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    z = random(Exo2SplitBinion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    quadrance(x) > big(0) || quadrance(x) < big(0) ||quadrance(x) == big(0)
end

@test begin
    x = random(Exo2SplitBinion{BigInt})
    y = random(Exo2SplitBinion{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo2SplitBinion(0, 0.0))
end

@test_throws ErrorException begin
    inv(Exo2SplitBinion(1, 1))
end

@test_throws ErrorException begin
    random(Exo2SplitBinion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo2SplitBinion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo2SplitBinion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo2SplitBinion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo2SplitBinion{BigInt})
    z == z + zero(Exo2SplitBinion{BigInt})
end

@test begin
    z = random(Exo2SplitBinion{BigInt})
    z == z * one(Exo2SplitBinion{BigInt})
end

@test begin
    z = random(Exo2SplitBinion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo2SplitBinion{BigInt})
    z == z * one(z)
end
