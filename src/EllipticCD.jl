"""
    EllipticCD{T <: Number} <: CDConstruct{T}

An elliptic Cayley-Dickson construct as a pair.
"""
struct EllipticCD{T <: Number} <: CDConstruct{T}
    l::T
    r::T
end

function (==)(x::EllipticCD, y::EllipticCD)
    x.l == y.l && x.r == y.r
end

function real(z::EllipticCD)
    real(z.l)
end

function abs2(z::EllipticCD)
    abs2(z.l) + abs2(z.r)
end

function iszerodivisor(z::EllipticCD)
    iszero(z)
end

function zero(::Type{EllipticCD{T}}) where T <: Number
    EllipticCD{T}(zero(T), zero(T))
end

function zero(::EllipticCD{T}) where T <: Number
    zero(EllipticCD{T})
end

function one(::Type{EllipticCD{T}}) where T <: Number
    EllipticCD{T}(one(T), zero(T))
end

function one(::EllipticCD{T}) where T <: Number
    one(EllipticCD{T})
end

function (-)(z::EllipticCD)
    EllipticCD(-(z.l), -(z.r))
end

function conj(z::EllipticCD)
    EllipticCD(conj(z.l), -(z.r))
end

function (+)(x::EllipticCD, y::EllipticCD)
    EllipticCD(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::EllipticCD{T}) where T <: Number
    EllipticCD{T}(a + z.l, z.r)
end

function (+)(z::EllipticCD{T}, a::T) where T <: Number
    EllipticCD{T}(z.l + a, z.r)
end

function (+)(a::Real, z::EllipticCD)
    EllipticCD(a + z.l, z.r)
end

function (+)(z::EllipticCD, a::Real)
    EllipticCD(z.l + a, z.r)
end

function (-)(x::EllipticCD, y::EllipticCD)
    EllipticCD(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::EllipticCD{T}) where T <: Number
    EllipticCD{T}(a - z.l, -(z.r))
end

function (-)(z::EllipticCD{T}, a::T) where T <: Number
    EllipticCD{T}(z.l - a, z.r)
end

function (-)(a::Real, z::EllipticCD)
    EllipticCD(a - z.l, -(z.r))
end

function (-)(z::EllipticCD, a::Real)
    EllipticCD(z.l - a, z.r)
end

function (*)(x::EllipticCD, y::EllipticCD)
    EllipticCD(
        (x.l * y.l) - (conj(y.r) * x.r),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

function (*)(a::T, z::EllipticCD{T}) where T <: Number
    EllipticCD{T}(a * z.l, z.r * a)
end

function (*)(z::EllipticCD{T}, a::T) where T <: Number
    EllipticCD{T}(z.l * a, z.r * conj(a))
end

function (*)(a::Real, z::EllipticCD)
    EllipticCD(a * z.l, a * z.r)
end

function (*)(z::EllipticCD, a::Real)
    EllipticCD(z.l * a, z.r * a)
end

function (/)(z::EllipticCD, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    EllipticCD(z.l / a, z.r / a)
end

function (\)(a::Real, z::EllipticCD)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    EllipticCD(a \ z.l, a \ z.r)
end
