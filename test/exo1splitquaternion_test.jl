using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigInt()
    l = Exo1SplitQuaternion(Exoplex(a, b))
    r = Exo1SplitQuaternion(a, 0, 0, 0, b, 0, 0, 0)
    l == r
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo1SplitQuaternion(a))
end

@test begin
    a = 1
    !isreal(Exo1SplitQuaternion(a, a, a, a))
end

@test begin
    z = random(Exo1SplitQuaternion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Exo1SplitQuaternion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Exo1SplitQuaternion(1.0, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, a: 5.0, ia: 6.0, sa: 7.0, (is)a: 8.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1SplitQuaternion(1.0, 2, 3, 4, 5, 6, 7))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, a: 5.0, ia: 6.0, sa: 7.0, (is)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1SplitQuaternion(1.0, 2, 3, 4, 5, 6))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, a: 5.0, ia: 6.0, sa: 0.0, (is)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1SplitQuaternion(1.0, 2, 3, 4, 5))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, a: 5.0, ia: 0.0, sa: 0.0, (is)a: 0.0]"
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1SplitQuaternion(1.0, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1.0, i: 2.0, s: 3.0, is: 4.0, a: 0.0, ia: 0.0, sa: 0.0, (is)a: 0.0]"
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    d = CayleyDickson.randomBigFloat()
    l = Exo1SplitQuaternion(SplitQuaternion(a, b, c, d))
    r = Exo1SplitQuaternion(a, b, c, d)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    l = Exo1SplitQuaternion(Cplex(a, b))
    r = Exo1SplitQuaternion(a, b)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    b = CayleyDickson.randomBigFloat()
    c = CayleyDickson.randomBigInt()
    l = Exo1SplitQuaternion(a, b, c)
    r = Exo1SplitQuaternion(a, b, c, 0)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigFloat})
    y = random(Exo1SplitQuaternion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1SplitQuaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = random(SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1SplitQuaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    a = random(SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = x * y
    r = y * x
    l != r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l != r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = alternatorL(x, y)
    r = zero(Exo1SplitQuaternion{BigInt})
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = alternatorR(x, y)
    r = zero(Exo1SplitQuaternion{BigInt})
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo1SplitQuaternion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{Rational{BigInt}})
    y = random(Exo1SplitQuaternion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{Rational{BigInt}})
    y = random(Exo1SplitQuaternion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{Rational{BigInt}})
    y = random(Exo1SplitQuaternion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1SplitQuaternion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    a = random(SplitQuaternion{BigInt})
    x = random(Exo1SplitQuaternion{BigInt})
    l = commutator(a, x)
    r = zero(Exo1SplitQuaternion{BigInt})
    l != r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    z = random(Exo1SplitQuaternion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Exo1SplitQuaternion{BigInt})
    y = random(Exo1SplitQuaternion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo1SplitQuaternion(0, 0.0))
end

@test_throws ErrorException begin
    random(Exo1SplitQuaternion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo1SplitQuaternion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1SplitQuaternion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1SplitQuaternion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo1SplitQuaternion{BigInt})
    z == z + zero(Exo1SplitQuaternion{BigInt})
end

@test begin
    z = random(Exo1SplitQuaternion{BigInt})
    z == z * one(Exo1SplitQuaternion{BigInt})
end

@test begin
    z = random(Exo1SplitQuaternion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo1SplitQuaternion{BigInt})
    z == z * one(z)
end

@test begin
    widen(Exo1SplitQuaternion{Int32}) == Exo1SplitQuaternion{Int64}
end

@test begin
    float(Exo1SplitQuaternion{Int64}) == Exo1SplitQuaternion{Float64}
end

@test begin
    float(Exo1SplitQuaternion{Float64}) == Exo1SplitQuaternion{Float64}
end
