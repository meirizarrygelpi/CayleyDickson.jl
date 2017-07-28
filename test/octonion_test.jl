using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Octonion(a))
end

@test begin
    a = 1
    !isreal(Octonion(a, a, a, a))
end

@test begin
    z = random(Octonion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Octonion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Octonion(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 7.0, (ij)k: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Octonion(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 7.0, (ij)k: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Octonion(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 6.0, jk: 0.0, (ij)k: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Octonion(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 5.0, ik: 0.0, jk: 0.0, (ij)k: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Octonion(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, j: 3.0, ij: 4.0, k: 0.0, ik: 0.0, jk: 0.0, (ij)k: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Octonion(Quaternion(a, b, c, d))
    r = Octonion(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Octonion(Binion(a, b))
    r = Octonion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Octonion(a, b, c)
    r = Octonion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Octonion{BigFloat})
    y = random(Octonion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Octonion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(Quaternion{BigInt})
    z = random(Octonion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Octonion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(Quaternion{BigInt})
    z = random(Octonion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    z = random(Octonion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    z = random(Octonion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = alternatorL(x, y)
    r = zero(Octonion{BigInt})
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = alternatorR(x, y)
    r = zero(Octonion{BigInt})
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = flexator(x, y)
    r = zero(Octonion{BigInt})
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Octonion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Octonion{Rational{BigInt}})
    y = random(Octonion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Octonion{Rational{BigInt}})
    y = random(Octonion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Octonion{Rational{BigInt}})
    y = random(Octonion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    z = random(Octonion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Octonion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(Quaternion{BigInt})
    x = random(Octonion{BigInt})
    l = commutator(a, x)
    r = zero(Octonion{BigInt})
    l != r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    z = random(Octonion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    z = random(Octonion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    z = random(Octonion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Octonion{BigInt})
    quadrance(x) > big(0)
end

@test begin
    x = random(Octonion{BigInt})
    y = random(Octonion{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l == r
end

@test_throws ErrorException begin
    inv(Octonion(0, 0.0))
end

@test_throws ErrorException begin
    random(Octonion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Octonion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Octonion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Octonion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Octonion{BigInt})
    z == z + zero(Octonion{BigInt})
end

@test begin
    z = random(Octonion{BigInt})
    z == z * one(Octonion{BigInt})
end

@test begin
    z = random(Octonion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Octonion{BigInt})
    z == z * one(z)
end

@test begin
    i = Octonion(0,1)
    j = Octonion(0,0,1)
    k = Octonion(0,0,0,0,1)
    anti_associator(i,j,k) == zero(Octonion{Int})
end
