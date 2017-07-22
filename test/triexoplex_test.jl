using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(TriExoplex(a))
end

@test begin
    a = 1
    !isreal(TriExoplex(a, a, a, a))
end

@test begin
    z = random(TriExoplex{Int})
    z == +(z)
end

@test begin
    a = 1
    real(TriExoplex(a)) == a
end

@test begin
    a = 1
    l = unreal(TriExoplex(0, a, a, a, a, a, a, a))
    r = [a, a, a, a, a, a, a]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, TriExoplex(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 7.0, (ab)c: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, TriExoplex(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 7.0, (ab)c: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, TriExoplex(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 0.0, (ab)c: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, TriExoplex(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 0.0, bc: 0.0, (ab)c: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, TriExoplex(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 0.0, ac: 0.0, bc: 0.0, (ab)c: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = TriExoplex(BiExoplex(a, b, c, d))
    r = TriExoplex(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = TriExoplex(Exoplex(a, b))
    r = TriExoplex(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = TriExoplex(a, b, c)
    r = TriExoplex(a, b, c, 0)
    l == r
end

@test begin
    x = random(TriExoplex{BigFloat})
    y = random(TriExoplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(TriExoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(BiExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(TriExoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(BiExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = alternatorL(x, y)
    r = zero(TriExoplex{BigInt})
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = alternatorR(x, y)
    r = zero(TriExoplex{BigInt})
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(TriExoplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(TriExoplex{Rational{BigInt}})
    y = random(TriExoplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(TriExoplex{Rational{BigInt}})
    y = random(TriExoplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(TriExoplex{Rational{BigInt}})
    y = random(TriExoplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(TriExoplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(BiExoplex{BigInt})
    x = random(TriExoplex{BigInt})
    l = commutator(a, x)
    r = zero(TriExoplex{BigInt})
    l != r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    z = random(TriExoplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(TriExoplex{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(TriExoplex{BigInt})
    y = random(TriExoplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(TriExoplex(0, 0.0))
end

@test_throws ErrorException begin
    random(TriExoplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(TriExoplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(TriExoplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(TriExoplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(TriExoplex{BigInt})
    z == z + zero(TriExoplex{BigInt})
end

@test begin
    z = random(TriExoplex{BigInt})
    z == z * one(TriExoplex{BigInt})
end

@test begin
    z = random(TriExoplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(TriExoplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(TriExoplex{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(TriExoplex{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(TriExoplex{BigInt})
    star(star(x)) == x
end

@test begin
    x = random(TriExoplex{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(TriExoplex{Rational{BigInt}})
    anti_selfstar(anti_selfstar(x)) == anti_selfstar(x)
end

@test begin
    A = TriExoplex(0, 1)
    B = TriExoplex(0, 0, 1)
    C = TriExoplex(0, 0, 0, 0, 1)
    l = jacobiator(A, B, C)
    r = zero(TriExoplex{Int})
    l != r
end

@test begin
    A = TriExoplex(0, 1)
    B = TriExoplex(0, 0, 1)
    C = TriExoplex(0, 0, 0, 0, 1)
    l = star(star(A * B) * C) + star(star(B * C) * A) + star(star(C * A) * B)
    r = zero(TriExoplex{Int})
    l == r
end
