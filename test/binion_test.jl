using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    promote_rule(Binion{Int}, Float64) == Binion{Float64}
end

@test begin
    promote_rule(Binion{Int}, Binion{Float64}) == Binion{Float64}
end

@test begin
    -(1.0 - Binion(2, 3)) == Binion(1.0, 3.0) == Binion(2, 3) - 1.0
end

@test begin
    1.0 + Binion(2, 3) == Binion(3.0, 3.0) == Binion(2, 3) + 1.0
end

@test begin
    convert(Binion{Float64}, 1) == Binion(1.0, 0)
end

@test begin
    convert(Binion{Float64}, Binion(1,2)) == Binion(1.0, 2.0)
end

@test begin
    convert(Binion, 2) == Binion(2, 0)
end

@test begin
    z = Binion{Int}(1, 2)
    convert(Elliptic{Int}, z) == z
end

@test begin
    convert(Int, Binion(3)) == 3
end

@test_throws InexactError begin
    convert(Int, Binion(3,4))
end

@test begin
    length(unreal(1)) == 0
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Binion(a))
end

@test begin
    a = 1
    !isreal(Binion(a, a))
end

@test begin
    z = random(Binion{Int})
    z == +(z)
end

@test begin
    a = CayleyDickson.randomBigFloat()
    real(Binion(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Binion(1, 2))
    l = String(take!(io))
    r = "[1: 1, i: 2]"
    l == r
end

@test begin
    x = random(Binion{BigFloat})
    y = random(Binion{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Binion{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Binion{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    z = random(Binion{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    z = random(Binion{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Binion{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Binion{Rational{BigInt}})
    y = random(Binion{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Binion{Rational{BigInt}})
    y = random(Binion{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Binion{Rational{BigInt}})
    y = random(Binion{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    z = random(Binion{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Binion{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    z = random(Binion{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    z = random(Binion{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    z = random(Binion{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Binion{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(Binion{BigInt})
    y = random(Binion{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Binion(0, 0.0))
end

@test_throws ErrorException begin
    random(Binion{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Binion{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Binion{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Binion{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Binion{BigInt})
    z == z + zero(Binion{BigInt})
end

@test begin
    z = random(Binion{BigInt})
    z == z * one(Binion{BigInt})
end

@test begin
    z = random(Binion{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Binion{BigInt})
    z == z * one(z)
end
