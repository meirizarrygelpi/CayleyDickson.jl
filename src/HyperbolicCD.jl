"""
    HyperbolicCD{T <: Number} <: CDConstruct{T}

A hyperbolic Cayley-Dickson construct as a pair.
"""
struct HyperbolicCD{T <: Number} <: CDConstruct{T}
    l::T
    r::T

    HyperbolicCD{T}(l::T, r::T) where T <: Number = new(l, r)
end

HyperbolicCD(l::T, r::T) where T <: Number = HyperbolicCD{T}(l, r)

function (==)(x::HyperbolicCD, y::HyperbolicCD)
    x.l == y.l && x.r == y.r
end

function real(z::HyperbolicCD)
    real(z.l)
end

function abs2(z::HyperbolicCD)
    abs2(z.l) - abs2(z.r)
end

function iszerodivisor(z::HyperbolicCD)
    abs2(z.l) == abs2(z.r)
end

function zero(::Type{HyperbolicCD{T}}) where T <: Number
    HyperbolicCD{T}(zero(T), zero(T))
end

function zero(::HyperbolicCD{T}) where T <: Number
    zero(HyperbolicCD{T})
end

function one(::Type{HyperbolicCD{T}}) where T <: Number
    HyperbolicCD{T}(one(T), zero(T))
end

function one(::HyperbolicCD{T}) where T <: Number
    one(HyperbolicCD{T})
end

function (-)(z::HyperbolicCD)
    HyperbolicCD(-(z.l), -(z.r))
end

function conj(z::HyperbolicCD)
    HyperbolicCD(conj(z.l), -(z.r))
end

function (+)(x::HyperbolicCD{T}, y::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(a + z.l, z.r)
end

function (+)(z::HyperbolicCD{T}, a::T) where T <: Number
    HyperbolicCD{T}(z.l + a, z.r)
end

function (+)(a::Real, z::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(a + z.l, z.r)
end

function (+)(z::HyperbolicCD{T}, a::Real) where T <: Number
    HyperbolicCD{T}(z.l + a, z.r)
end

function (-)(x::HyperbolicCD{T}, y::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(a - z.l, -(z.r))
end

function (-)(z::HyperbolicCD{T}, a::T) where T <: Number
    HyperbolicCD{T}(z.l - a, z.r)
end

function (-)(a::Real, z::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(a - z.l, -(z.r))
end

function (-)(z::HyperbolicCD{T}, a::Real) where T <: Number
    HyperbolicCD{T}(z.l - a, z.r)
end

function (*)(x::HyperbolicCD{T}, y::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(
        (x.l * y.l) + (conj(y.r) * x.r),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

function (*)(a::T, z::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(a * z.l, z.r * a)
end

function (*)(z::HyperbolicCD{T}, a::T) where T <: Number
    HyperbolicCD{T}(z.l * a, z.r * conj(a))
end

function (*)(a::Real, z::HyperbolicCD{T}) where T <: Number
    HyperbolicCD{T}(a * z.l, a * z.r)
end

function (*)(z::HyperbolicCD{T}, a::Real) where T <: Number
    HyperbolicCD{T}(z.l * a, z.r * a)
end

function (/)(z::HyperbolicCD, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    HyperbolicCD(z.l / a, z.r / a)
end

function (\)(a::Real, z::HyperbolicCD)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    HyperbolicCD(a \ z.l, a \ z.r)
end
