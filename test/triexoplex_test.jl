using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo3Real(a))
end

@test begin
    a = 1
    !isreal(Exo3Real(a, a, a, a))
end

@test begin
    z = random(Exo3Real{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Exo3Real(a)) == a
end

@test begin
    a = 1
    l = unreal(Exo3Real(0, a, a, a, a, a, a, a))
    r = [a, a, a, a, a, a, a]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo3Real(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 7.0, (ab)c: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo3Real(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 7.0, (ab)c: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo3Real(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 0.0, (ab)c: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo3Real(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 0.0, bc: 0.0, (ab)c: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo3Real(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 0.0, ac: 0.0, bc: 0.0, (ab)c: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Exo3Real(Exo2Real(a, b, c, d))
    r = Exo3Real(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo3Real(Exo1Real(a, b))
    r = Exo3Real(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo3Real(a, b, c)
    r = Exo3Real(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo3Real{BigFloat})
    y = random(Exo3Real{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo3Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Exo2Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo3Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Exo2Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = alternatorL(x, y)
    r = zero(Exo3Real{BigInt})
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = alternatorR(x, y)
    r = zero(Exo3Real{BigInt})
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo3Real{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo3Real{Rational{BigInt}})
    y = random(Exo3Real{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo3Real{Rational{BigInt}})
    y = random(Exo3Real{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo3Real{Rational{BigInt}})
    y = random(Exo3Real{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo3Real{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Exo2Real{BigInt})
    x = random(Exo3Real{BigInt})
    l = commutator(a, x)
    r = zero(Exo3Real{BigInt})
    l != r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    z = random(Exo3Real{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo3Real{BigInt})
    quadrance(x) > big(0) || quadrance(x) < big(0) || quadrance(x) == big(0)
end

@test begin
    x = random(Exo3Real{BigInt})
    y = random(Exo3Real{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo3Real(0, 0.0))
end

@test_throws ErrorException begin
    random(Exo3Real{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo3Real{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo3Real{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo3Real{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo3Real{BigInt})
    z == z + zero(Exo3Real{BigInt})
end

@test begin
    z = random(Exo3Real{BigInt})
    z == z * one(Exo3Real{BigInt})
end

@test begin
    z = random(Exo3Real{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo3Real{BigInt})
    z == z * one(z)
end

@test begin
    x = random(Exo3Real{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(Exo3Real{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(Exo3Real{BigInt})
    star(star(x)) == x
end

@test begin
    x = random(Exo3Real{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(Exo3Real{Rational{BigInt}})
    anti_selfstar(anti_selfstar(x)) == anti_selfstar(x)
end

@test begin
    A = Exo3Real(0, 1)
    B = Exo3Real(0, 0, 1)
    C = Exo3Real(0, 0, 0, 0, 1)
    l = jacobiator(A, B, C)
    r = zero(Exo3Real{Int})
    l != r
end

@test begin
    A = Exo3Real(0, 1)
    B = Exo3Real(0, 0, 1)
    C = Exo3Real(0, 0, 0, 0, 1)
    l = star(star(A * B) * C) + star(star(B * C) * A) + star(star(C * A) * B)
    r = zero(Exo3Real{Int})
    l == r
end
