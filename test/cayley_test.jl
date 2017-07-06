using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Cayley(a))
end

@test begin
    a = 1
    !isreal(Cayley(a, a, a, a))
end

@test begin
    z = random(Cayley{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Cayley(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Cayley(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 7.0, (ij)k: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Cayley(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 7.0, (ij)k: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Cayley(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 0.0, (ij)k: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Cayley(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 0.0, jk: 0.0, (ij)k: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Cayley(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 0.0, ik: 0.0, jk: 0.0, (ij)k: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Cayley(Hamilton(a, b, c, d))
    r = Cayley(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Cayley(Cplex(a, b))
    r = Cayley(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Cayley(a, b, c)
    r = Cayley(a, b, c, 0)
    l == r
end

@test begin
    x = random(Cayley{BigFloat})
    y = random(Cayley{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Cayley{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(Cayley{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Cayley{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    z = random(Cayley{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    z = random(Cayley{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    z = random(Cayley{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = alternatorL(x, y)
    r = zero(Cayley{BigInt})
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = alternatorR(x, y)
    r = zero(Cayley{BigInt})
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = flexator(x, y)
    r = zero(Cayley{BigInt})
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Cayley{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Cayley{Rational{BigInt}})
    y = random(Cayley{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Cayley{Rational{BigInt}})
    y = random(Cayley{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Cayley{Rational{BigInt}})
    y = random(Cayley{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    z = random(Cayley{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Cayley{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Hamilton{BigInt})
    x = random(Cayley{BigInt})
    l = commutator(a, x)
    r = zero(Cayley{BigInt})
    l != r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    z = random(Cayley{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    z = random(Cayley{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    z = random(Cayley{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Cayley{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(Cayley{BigInt})
    y = random(Cayley{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Cayley(0, 0.0))
end

@test_throws ErrorException begin
    random(Cayley{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Cayley{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Cayley{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Cayley{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Cayley{BigInt})
    z == z + zero(Cayley{BigInt})
end

@test begin
    z = random(Cayley{BigInt})
    z == z * one(Cayley{BigInt})
end

@test begin
    z = random(Cayley{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Cayley{BigInt})
    z == z * one(z)
end
