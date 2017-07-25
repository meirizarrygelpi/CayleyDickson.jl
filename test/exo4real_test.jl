using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo4Real(Exo3Real(a)))
end

@test begin
    a = 1
    !isreal(Exo4Real(Exo3Real(a, a, a, a)))
end

@test begin
    z = random(Exo4Real{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Exo4Real(Exo3Real(a))) == a
end

@test begin
    io = IOBuffer()
    show(io, Exo4Real(Exo3Real(1.0, 2, 3, 4, 5, 6, 7, 8)))
    l = String(take!(io))
    r = "[1: 1.0, a: 2.0, b: 3.0, ab: 4.0, c: 5.0, ac: 6.0, bc: 7.0, (ab)c: 8.0, d: 0.0, ad: 0.0, bd: 0.0, (ab)d: 0.0, cd: 0.0, (ac)d: 0.0, (bc)d: 0.0, ((ab)c)d: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigInt()
    l = Exo4Real(Exo3Real(a, b, c, d))
    r = Exo4Real(Exo2Real(a, b, c, d))
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = Exo4Real(Exoplex(a, b))
    r = Exo4Real(Exo3Real(a, b))
    l == r
end

@test begin
    x = random(Exo4Real{BigFloat})
    y = random(Exo4Real{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo4Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Exo3Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo4Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Exo3Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = alternatorL(x, y)
    r = zero(Exo4Real{BigInt})
    l != r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = alternatorR(x, y)
    r = zero(Exo4Real{BigInt})
    l != r
end

@test begin
    x = random(Exo4Real{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo4Real{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

# @test begin
#     x = random(Exo4Real{Rational{BigInt}})
#     y = random(Exo4Real{Rational{BigInt}})
#     z = x * y
#     z / y == x
# end

# @test begin
#     x = random(Exo4Real{Rational{BigInt}})
#     y = random(Exo4Real{Rational{BigInt}})
#     z = x * y
#     x \ z == y
# end

# @test begin
#     x = random(Exo4Real{Rational{BigInt}})
#     y = random(Exo4Real{Rational{BigInt}})
#     l = inv(x * y)
#     r = inv(y) * inv(x)
#     l == r
# end

# @test begin
#     x = random(Exo4Real{Rational{BigInt}})
#     y = random(Exo4Real{Rational{BigInt}})
#     l = inv(x / y)
#     r = y / x
#     l == r
# end

# @test begin
#     x = random(Exo4Real{Rational{BigInt}})
#     y = random(Exo4Real{Rational{BigInt}})
#     l = inv(x \ y)
#     r = y \ x
#     l == r
# end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo4Real{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Exo3Real{BigInt})
    x = random(Exo4Real{BigInt})
    l = commutator(a, x)
    r = zero(Exo4Real{BigInt})
    l != r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    z = random(Exo4Real{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo4Real{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Exo4Real{BigInt})
    y = random(Exo4Real{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo4Real(Exo3Real(0)))
end

@test_throws ErrorException begin
    random(Exo4Real{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo4Real{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo4Real{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo4Real{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo4Real{BigInt})
    z == z + zero(Exo4Real{BigInt})
end

@test begin
    z = random(Exo4Real{BigInt})
    z == z * one(Exo4Real{BigInt})
end

@test begin
    z = random(Exo4Real{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo4Real{BigInt})
    z == z * one(z)
end

@test begin
    x = random(Exo4Real{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(Exo4Real{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(Exo4Real{BigInt})
    star(star(x)) == dagger(x)
end

@test begin
    x = random(Exo4Real{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(Exo4Real{Rational{BigInt}})
    anti_selfstar(anti_selfstar(x)) == anti_selfstar(x)
end
