"""
    ParabolicCD{T <: Number} <: CDConstruct{T}

A parabolic Cayley-Dickson construct as a pair of `Number`s.
"""
struct ParabolicCD{T <: Number} <: CDConstruct{T}
    l::T
    r::T

    ParabolicCD{T}(l::T, r::T) where T <: Number = new(l, r)
end

function ParabolicCD(a::T, b::T) where T <: Number
    ParabolicCD{T}(a, b)
end

function ParabolicCD(l::Number, r::Number)
    ParabolicCD(promote(l, r)...)
end

function (==)(x::ParabolicCD, y::ParabolicCD)
    x.l == y.l && x.r == y.r
end

function real(z::ParabolicCD)
    real(z.l)
end

function abs2(z::ParabolicCD)
    abs2(z.l)
end

function iszerodivisor(z::ParabolicCD)
    iszerodivisor(z.l)
end

function zero(::Type{ParabolicCD{T}}) where T <: Number
    ParabolicCD{T}(zero(T), zero(T))
end

function zero(::ParabolicCD{T}) where T <: Number
    zero(ParabolicCD{T})
end

function one(::Type{ParabolicCD{T}}) where T <: Number
    ParabolicCD{T}(one(T), zero(T))
end

function one(::ParabolicCD{T}) where T <: Number
    one(ParabolicCD{T})
end

function (-)(z::ParabolicCD)
    ParabolicCD(-(z.l), -(z.r))
end

function conj(z::ParabolicCD)
    ParabolicCD(conj(z.l), -(z.r))
end

function (+)(x::ParabolicCD, y::ParabolicCD)
    ParabolicCD(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::ParabolicCD{T}) where T <: Number
    ParabolicCD{T}(a + z.l, z.r)
end

function (+)(z::ParabolicCD{T}, a::T) where T <: Number
    ParabolicCD{T}(z.l + a, z.r)
end

function (+)(a::Real, z::ParabolicCD)
    ParabolicCD(a + z.l, z.r)
end

function (+)(z::ParabolicCD, a::Real)
    ParabolicCD(z.l + a, z.r)
end

function (-)(x::ParabolicCD, y::ParabolicCD)
    ParabolicCD(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::ParabolicCD{T}) where T <: Number
    ParabolicCD{T}(a - z.l, -(z.r))
end

function (-)(z::ParabolicCD{T}, a::T) where T <: Number
    ParabolicCD{T}(z.l - a, z.r)
end

function (-)(a::Real, z::ParabolicCD)
    ParabolicCD(a - z.l, -(z.r))
end

function (-)(z::ParabolicCD, a::Real)
    ParabolicCD(z.l - a, z.r)
end

function (*)(x::ParabolicCD, y::ParabolicCD)
    ParabolicCD(
        (x.l * y.l),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

function (*)(a::T, z::ParabolicCD{T}) where T <: Number
    ParabolicCD{T}(a * z.l, z.r * a)
end

function (*)(z::ParabolicCD{T}, a::T) where T <: Number
    ParabolicCD{T}(z.l * a, z.r * conj(a))
end

function (*)(a::Real, z::ParabolicCD)
    ParabolicCD(a * z.l, a * z.r)
end

function (*)(z::ParabolicCD, a::Real)
    ParabolicCD(z.l * a, z.r * a)
end

function (/)(z::ParabolicCD, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    ParabolicCD(z.l / a, z.r / a)
end

function (\)(a::Real, z::ParabolicCD)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    ParabolicCD(a \ z.l, a \ z.r)
end
