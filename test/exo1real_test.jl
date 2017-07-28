using CayleyDickson
using Base.Test: @test, @test_throws

@test begin
    promote_rule(Exo1Real{Int}, Float64) == Exo1Real{Float64}
end

@test begin
    promote_rule(Exo1Real{Int}, Exo1Real{Float64}) == Exo1Real{Float64}
end

@test begin
    -(1.0 - Exo1Real(2, 3)) == Exo1Real(1.0, 3.0) == Exo1Real(2, 3) - 1.0
end

@test begin
    1.0 + Exo1Real(2, 3) == Exo1Real(3.0, 3.0) == Exo1Real(2, 3) + 1.0
end

@test begin
    convert(Exo1Real{Float64}, 1) == Exo1Real(1.0, 0)
end

@test begin
    convert(Exo1Real{Float64}, Exo1Real(1,2)) == Exo1Real(1.0, 2.0)
end

@test begin
    convert(Exo1Real, 2) == Exo1Real(2, 0)
end

@test begin
    z = Exo1Real{Int}(1, 2)
    convert(Parabolic{Int}, z) == z
end

@test begin
    convert(Int, Exo1Real(3)) == 3
end

@test_throws InexactError begin
    convert(Int, Exo1Real(3,4))
end

@test begin
    a = CayleyDickson.randomBigFloat()
    isreal(Exo1Real(a))
end

@test begin
    a = 1
    !isreal(Exo1Real(a, a))
end

@test begin
    z = random(Exo1Real{Int})
    z == +(z)
end

@test begin
    a = 1
    real(Exo1Real(a)) == a
end

@test begin
    a = 1
    l = unreal(Exo1Real(0, a))
    r = [a]
    l == r
end

@test begin
    io = IOBuffer()
    show(io, Exo1Real(1, 2))
    l = String(take!(io))
    r = "[1: 1, a: 2]"
    l == r
end

@test begin
    x = random(Exo1Real{BigFloat})
    y = random(Exo1Real{BigFloat})
    x != y
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1Real{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    z = random(Exo1Real{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    z = random(Exo1Real{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    z = random(Exo1Real{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    conj(conj(x)) == x
end

@test begin
    x = random(Exo1Real{BigInt})
    cloak(cloak(x)) == x
end

@test begin
    x = random(Exo1Real{BigInt})
    dagger(dagger(x)) == x
end

@test begin
    x = random(Exo1Real{BigInt})
    star(star(x)) == x
end

@test begin
    x = random(Exo1Real{Rational{BigInt}})
    selfstar(selfstar(x)) == selfstar(x)
end

@test begin
    x = random(Exo1Real{Rational{BigInt}})
    anti_selfstar(anti_selfstar(x)) == anti_selfstar(x)
end

@test begin
    x = random(Exo1Real{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = conj(x * y)
    r = conj(y) * conj(x)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = conj(x + y)
    r = conj(x) + conj(y)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = conj(x - y)
    r = conj(x) - conj(y)
    l == r
end

@test begin
    x = random(Exo1Real{Rational{BigInt}})
    y = random(Exo1Real{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Exo1Real{Rational{BigInt}})
    y = random(Exo1Real{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Exo1Real{Rational{BigInt}})
    y = random(Exo1Real{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    z = random(Exo1Real{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = CayleyDickson.randomBigInt()
    x = random(Exo1Real{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    z = random(Exo1Real{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    z = random(Exo1Real{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    z = random(Exo1Real{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Exo1Real{BigInt})
    quadrance(x) > big(0) || quadrance(x) == big(0)
end

@test begin
    x = random(Exo1Real{BigInt})
    y = random(Exo1Real{BigInt})
    l = quadrance(x * y)
    r = quadrance(x) * quadrance(y)
    l == r
end

@test_throws ErrorException begin
    inv(Exo1Real(0, 0.0))
end

@test_throws ErrorException begin
    inv(Exo1Real(0, 1.0))
end

@test_throws ErrorException begin
    random(Exo1Real{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Exo1Real{Int})
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1Real{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = CayleyDickson.randomBigRational()
    z = random(Exo1Real{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Exo1Real{BigInt})
    z == z + zero(Exo1Real{BigInt})
end

@test begin
    z = random(Exo1Real{BigInt})
    z == z * one(Exo1Real{BigInt})
end

@test begin
    z = random(Exo1Real{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Exo1Real{BigInt})
    z == z * one(z)
end

@test begin
    float(Exo1Real{Float64}) == Exo1Real{Float64}
end
