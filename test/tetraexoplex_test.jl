using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(TetraExoplex(TriExoplex(a)))
end

@test begin
    a = 1
    !isreal(TetraExoplex(TriExoplex(a, a, a, a)))
end

@test begin
    z = random(TetraExoplex{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(TetraExoplex(TriExoplex(a))) == a
end

@test begin
    io = IOBuffer()
    show(io, TetraExoplex(TriExoplex(1.0, 2, 3, 4, 5, 6, 7, 8)))
    l = String(take!(io))
    r = "[1: 1.0, A: 2.0, B: 3.0, AB: 4.0, C: 5.0, AC: 6.0, BC: 7.0, (AB)C: 8.0, D: 0.0, AD: 0.0, BD: 0.0, (AB)D: 0.0, CD: 0.0, (AC)D: 0.0, (BC)D: 0.0, ((AB)C)D: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigInt()
    l = TetraExoplex(TriExoplex(a, b, c, d))
    r = TetraExoplex(BiExoplex(a, b, c, d))
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = TetraExoplex(Exoplex(a, b))
    r = TetraExoplex(TriExoplex(a, b))
    l == r
end

@test begin
    x = random(TetraExoplex{BigFloat})
    y = random(TetraExoplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(TetraExoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(TriExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(TetraExoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(TriExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = alternatorL(x, y)
    r = zero(TetraExoplex{BigInt})
    l != r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = alternatorR(x, y)
    r = zero(TetraExoplex{BigInt})
    l != r
end

@test begin
    x = random(TetraExoplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(TetraExoplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

# @test begin
#     x = random(TetraExoplex{Rational{BigInt}})
#     y = random(TetraExoplex{Rational{BigInt}})
#     z = x * y
#     z / y == x
# end

# @test begin
#     x = random(TetraExoplex{Rational{BigInt}})
#     y = random(TetraExoplex{Rational{BigInt}})
#     z = x * y
#     x \ z == y
# end

# @test begin
#     x = random(TetraExoplex{Rational{BigInt}})
#     y = random(TetraExoplex{Rational{BigInt}})
#     l = inv(x * y)
#     r = inv(y) * inv(x)
#     l == r
# end

# @test begin
#     x = random(TetraExoplex{Rational{BigInt}})
#     y = random(TetraExoplex{Rational{BigInt}})
#     l = inv(x / y)
#     r = y / x
#     l == r
# end

# @test begin
#     x = random(TetraExoplex{Rational{BigInt}})
#     y = random(TetraExoplex{Rational{BigInt}})
#     l = inv(x \ y)
#     r = y \ x
#     l == r
# end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(TetraExoplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(TriExoplex{BigInt})
    x = random(TetraExoplex{BigInt})
    l = commutator(a, x)
    r = zero(TetraExoplex{BigInt})
    l != r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    z = random(TetraExoplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(TetraExoplex{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(TetraExoplex{BigInt})
    y = random(TetraExoplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(TetraExoplex(TriExoplex(0)))
end

@test_throws ErrorException begin
    random(TetraExoplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(TetraExoplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(TetraExoplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(TetraExoplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(TetraExoplex{BigInt})
    z == z + zero(TetraExoplex{BigInt})
end

@test begin
    z = random(TetraExoplex{BigInt})
    z == z * one(TetraExoplex{BigInt})
end

@test begin
    z = random(TetraExoplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(TetraExoplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(TetraExoplex{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(TetraExoplex{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(TetraExoplex{BigInt})
    star(star(x)) == dagger(x)
end

@test begin
    x = random(TetraExoplex{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(TetraExoplex{Rational{BigInt}})
    antiselfstar(antiselfstar(x)) == antiselfstar(x)
end
