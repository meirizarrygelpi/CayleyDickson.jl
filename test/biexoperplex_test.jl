using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    l = BiExoPerplex(BiExoplex(1,2,3,4))
    r = BiExoPerplex(1,0,2,0,3,0,4)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(BiExoPerplex(a))
end

@test begin
    a = 1
    !isreal(BiExoPerplex(a, a, a, a))
end

@test begin
    z = random(BiExoPerplex{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(BiExoPerplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, BiExoPerplex(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 6.0, ab: 7.0, (sa)b: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoPerplex(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 6.0, ab: 7.0, (sa)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoPerplex(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 6.0, ab: 0.0, (sa)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoPerplex(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 5.0, sb: 0.0, ab: 0.0, (sa)b: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, BiExoPerplex(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, s: 2.0, a: 3.0, sa: 4.0, b: 0.0, sb: 0.0, ab: 0.0, (sa)b: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = BiExoPerplex(ExoPerplex(a, b, c, d))
    r = BiExoPerplex(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = BiExoPerplex(Perplex(a, b))
    r = BiExoPerplex(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = BiExoPerplex(a, b, c)
    r = BiExoPerplex(a, b, c, 0)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigFloat})
    y = random(BiExoPerplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(BiExoPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(ExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(BiExoPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(ExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = alternatorL(x, y)
    r = zero(BiExoPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = alternatorR(x, y)
    r = zero(BiExoPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(BiExoPerplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(BiExoPerplex{Rational{BigInt}})
    y = random(BiExoPerplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(BiExoPerplex{Rational{BigInt}})
    y = random(BiExoPerplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(BiExoPerplex{Rational{BigInt}})
    y = random(BiExoPerplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(BiExoPerplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(ExoPerplex{BigInt})
    x = random(BiExoPerplex{BigInt})
    l = commutator(a, x)
    r = zero(BiExoPerplex{BigInt})
    l != r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    z = random(BiExoPerplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(BiExoPerplex{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) ||abs2(x) == big(0)
end

@test begin
    x = random(BiExoPerplex{BigInt})
    y = random(BiExoPerplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(BiExoPerplex(0, 0.0))
end

@test_throws ErrorException begin
    inv(BiExoPerplex(1, 1))
end

@test_throws ErrorException begin
    random(BiExoPerplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(BiExoPerplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(BiExoPerplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(BiExoPerplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(BiExoPerplex{BigInt})
    z == z + zero(BiExoPerplex{BigInt})
end

@test begin
    z = random(BiExoPerplex{BigInt})
    z == z * one(BiExoPerplex{BigInt})
end

@test begin
    z = random(BiExoPerplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(BiExoPerplex{BigInt})
    z == z * one(z)
end
