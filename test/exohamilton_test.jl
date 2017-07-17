using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = ExoHamilton(Exoplex(a, b))
    r = ExoHamilton(a, 0, 0, 0, b, 0, 0, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(ExoHamilton(a))
end

@test begin
    a = 1
    !isreal(ExoHamilton(a, a, a, a))
end

@test begin
    z = random(ExoHamilton{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(ExoHamilton(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, ExoHamilton(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 6.0, ja: 7.0, (ij)a: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoHamilton(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 6.0, ja: 7.0, (ij)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoHamilton(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 6.0, ja: 0.0, (ij)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoHamilton(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 5.0, ia: 0.0, ja: 0.0, (ij)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, ExoHamilton(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, a: 0.0, ia: 0.0, ja: 0.0, (ij)a: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = ExoHamilton(Hamilton(a, b, c, d))
    r = ExoHamilton(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = ExoHamilton(Cplex(a, b))
    r = ExoHamilton(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = ExoHamilton(a, b, c)
    r = ExoHamilton(a, b, c, 0)
    l == r
end

@test begin
    x = random(ExoHamilton{BigFloat})
    y = random(ExoHamilton{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoHamilton{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(ExoHamilton{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = alternatorL(x, y)
    r = zero(ExoHamilton{BigInt})
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = alternatorR(x, y)
    r = zero(ExoHamilton{BigInt})
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(ExoHamilton{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(ExoHamilton{Rational{BigInt}})
    y = random(ExoHamilton{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(ExoHamilton{Rational{BigInt}})
    y = random(ExoHamilton{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(ExoHamilton{Rational{BigInt}})
    y = random(ExoHamilton{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(ExoHamilton{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    x = random(ExoHamilton{BigInt})
    l = commutator(a, x)
    r = zero(ExoHamilton{BigInt})
    l != r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    z = random(ExoHamilton{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(ExoHamilton{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(ExoHamilton{BigInt})
    y = random(ExoHamilton{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(ExoHamilton(0, 0.0))
end

@test_throws ErrorException begin
    random(ExoHamilton{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(ExoHamilton{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoHamilton{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(ExoHamilton{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(ExoHamilton{BigInt})
    z == z + zero(ExoHamilton{BigInt})
end

@test begin
    z = random(ExoHamilton{BigInt})
    z == z * one(ExoHamilton{BigInt})
end

@test begin
    z = random(ExoHamilton{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(ExoHamilton{BigInt})
    z == z * one(z)
end
