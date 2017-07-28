using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Sedenion(Octonion(a)))
end

@test begin
    a = 1
    !isreal(Sedenion(Octonion(a, a, a, a)))
end

@test begin
    z = random(Sedenion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Sedenion(Octonion(a))) == a
end

@test begin
    io = IOBuffer()
    show(io, Sedenion(Octonion(1.0, 2, 3, 4, 5, 6, 7, 8)))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 7.0, (ij)k: 8.0, m: 0.0, im: 0.0, jm: 0.0, (ij)m: 0.0, km: 0.0, (ik)m: 0.0, (jk)m: 0.0, ((ij)k)m: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigInt()
    l = Sedenion(Octonion(a, b, c, d))
    r = Sedenion(Quaternion(a, b, c, d))
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = Sedenion(Binion(a, b))
    r = Sedenion(Octonion(a, b))
    l == r
end

@test begin
    x = random(Sedenion{BigFloat})
    y = random(Sedenion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Sedenion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Octonion{BigInt})
    z = random(Sedenion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Sedenion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Octonion{BigInt})
    z = random(Sedenion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    z = random(Sedenion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    z = random(Sedenion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = alternatorL(x, y)
    r = zero(Sedenion{BigInt})
    l != r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = alternatorR(x, y)
    r = zero(Sedenion{BigInt})
    l != r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = flexator(x, y)
    r = zero(Sedenion{BigInt})
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Sedenion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

# @test begin
#     x = random(Sedenion{Rational{BigInt}})
#     y = random(Sedenion{Rational{BigInt}})
#     z = x * y
#     z / y == x
# end

# @test begin
#     x = random(Sedenion{Rational{BigInt}})
#     y = random(Sedenion{Rational{BigInt}})
#     z = x * y
#     x \ z == y
# end

# @test begin
#     x = random(Sedenion{Rational{BigInt}})
#     y = random(Sedenion{Rational{BigInt}})
#     l = inv(x * y)
#     r = inv(y) * inv(x)
#     l == r
# end

# @test begin
#     x = random(Sedenion{Rational{BigInt}})
#     y = random(Sedenion{Rational{BigInt}})
#     l = inv(x / y)
#     r = y / x
#     l == r
# end

# @test begin
#     x = random(Sedenion{Rational{BigInt}})
#     y = random(Sedenion{Rational{BigInt}})
#     l = inv(x \ y)
#     r = y \ x
#     l == r
# end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    z = random(Sedenion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Sedenion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Octonion{BigInt})
    x = random(Sedenion{BigInt})
    l = commutator(a, x)
    r = zero(Sedenion{BigInt})
    l != r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    z = random(Sedenion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    z = random(Sedenion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    z = random(Sedenion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Sedenion{BigInt})
    quadrance(x) > big(0) || quadrance(x) == big(0)
end

@test begin
    x = random(Sedenion{BigInt})
    y = random(Sedenion{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l != r
end

@test_throws ErrorException begin
    inv(Sedenion(Octonion(0)))
end

@test_throws ErrorException begin
    random(Sedenion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Sedenion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Sedenion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Sedenion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Sedenion{BigInt})
    z == z + zero(Sedenion{BigInt})
end

@test begin
    z = random(Sedenion{BigInt})
    z == z * one(Sedenion{BigInt})
end

@test begin
    z = random(Sedenion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Sedenion{BigInt})
    z == z * one(z)
end

@test begin
    i = Sedenion{Int}(Octonion(0,1), zero(Octonion{Int}))
    m = Sedenion{Int}(zero(Octonion{Int}), one(Octonion{Int}))
    anti_alternatorL(i, m) != zero(Sedenion{Int})
end

@test begin
    i = Sedenion{Int}(Octonion(0,1), zero(Octonion{Int}))
    m = Sedenion{Int}(zero(Octonion{Int}), one(Octonion{Int}))
    anti_alternatorR(i, m) != zero(Sedenion{Int})
end

@test begin
    i = Sedenion{Int}(Octonion(0,1), zero(Octonion{Int}))
    m = Sedenion{Int}(zero(Octonion{Int}), one(Octonion{Int}))
    anti_flexator(i, m) != zero(Sedenion{Int})
end
