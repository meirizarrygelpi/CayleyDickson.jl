using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    promote_rule(SplitBinion{Int}, Float64) == SplitBinion{Float64}
end

@test begin
    promote_rule(SplitBinion{Int}, SplitBinion{Float64}) == SplitBinion{Float64}
end

@test begin
    -(1.0 - SplitBinion(2, 3)) == SplitBinion(1.0, 3.0) == SplitBinion(2, 3) - 1.0
end

@test begin
    1.0 + SplitBinion(2, 3) == SplitBinion(3.0, 3.0) == SplitBinion(2, 3) + 1.0
end

@test begin
    convert(SplitBinion{Float64}, 1) == SplitBinion(1.0, 0)
end

@test begin
    convert(SplitBinion{Float64}, SplitBinion(1,2)) == SplitBinion(1.0, 2.0)
end

@test begin
    convert(SplitBinion, 2) == SplitBinion(2, 0)
end

@test begin
    z = SplitBinion{Int}(1, 2)
    convert(Hyperbolic{Int}, z) == z
end

@test begin
    convert(Int, SplitBinion(3)) == 3
end

@test_throws InexactError begin
    convert(Int, SplitBinion(3,4))
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(SplitBinion(a))
end

@test begin
    a = 1
    !isreal(SplitBinion(a, a))
end

@test begin
    z = random(SplitBinion{Int})
    z == +(z)
end

@test begin
    a = 1
    real(SplitBinion(a)) == a
end

@test begin
    a = 1
    l = unreal(SplitBinion(0, a)) 
    r = [a]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, SplitBinion(1, 2))
    l = String(take!(io))
    r = "[1: 1, s: 2]"
    l == r
end

@test begin
    x = random(SplitBinion{BigFloat})
    y = random(SplitBinion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(SplitBinion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(SplitBinion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    z = random(SplitBinion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    z = random(SplitBinion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(SplitBinion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(SplitBinion{Rational{BigInt}})
    y = random(SplitBinion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(SplitBinion{Rational{BigInt}})
    y = random(SplitBinion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(SplitBinion{Rational{BigInt}})
    y = random(SplitBinion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    z = random(SplitBinion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(SplitBinion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    z = random(SplitBinion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    z = random(SplitBinion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    z = random(SplitBinion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(SplitBinion{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(SplitBinion{BigInt})
    y = random(SplitBinion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(SplitBinion(0, 0.0))
end

@test_throws ErrorException begin
    inv(SplitBinion(1, 1))
end

@test_throws ErrorException begin
    random(SplitBinion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(SplitBinion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(SplitBinion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(SplitBinion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(SplitBinion{BigInt})
    z == z + zero(SplitBinion{BigInt})
end

@test begin
    z = random(SplitBinion{BigInt})
    z == z * one(SplitBinion{BigInt})
end

@test begin
    z = random(SplitBinion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(SplitBinion{BigInt})
    z == z * one(z)
end

@test begin
    float(SplitBinion{Float64}) == SplitBinion{Float64}
end
