using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Perplex(a))
end

@test begin
    a = 1
    !isreal(Perplex(a, a))
end

@test begin
    z = random(Perplex{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Perplex(a)) == a
end

@test begin
    a = 1
    l = unreal(Perplex(0, a)) 
    r = [a]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Perplex(1, 2))
    l = String(take!(io))
    r = "[1: 1, s: 2]"
    l == r
end

@test begin
    x = random(Perplex{BigFloat})
    y = random(Perplex{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Perplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Perplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    z = random(Perplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    z = random(Perplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Perplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Perplex{Rational{BigInt}})
    y = random(Perplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Perplex{Rational{BigInt}})
    y = random(Perplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Perplex{Rational{BigInt}})
    y = random(Perplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    z = random(Perplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Perplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    z = random(Perplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    z = random(Perplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    z = random(Perplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Perplex{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Perplex{BigInt})
    y = random(Perplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Perplex(0, 0.0))
end

@test_throws ErrorException begin
    inv(Perplex(1, 1))
end

@test_throws ErrorException begin
    random(Perplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Perplex{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Perplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Perplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Perplex{BigInt})
    z == z + zero(Perplex{BigInt})
end

@test begin
    z = random(Perplex{BigInt})
    z == z * one(Perplex{BigInt})
end

@test begin
    z = random(Perplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Perplex{BigInt})
    z == z * one(z)
end

@test begin
    float(Perplex{Float64}) == Perplex{Float64}
end
