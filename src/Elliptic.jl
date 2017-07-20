"""
    Elliptic{T <: Number} <: Construct{T}

An elliptic Cayley-Dickson construct as a pair.
"""
struct Elliptic{T <: Number} <: Construct{T}
    l::T
    r::T
end

function (==)(x::Elliptic, y::Elliptic)
    x.l == y.l && x.r == y.r
end

function real(z::Elliptic)
    real(z.l)
end

function abs2(z::Elliptic)
    abs2(z.l) + abs2(z.r)
end

function iszerodivisor(z::Elliptic)
    iszero(z)
end

function zero(::Type{Elliptic{T}}) where T <: Number
    Elliptic{T}(zero(T), zero(T))
end

function zero(::Elliptic{T}) where T <: Number
    zero(Elliptic{T})
end

function one(::Type{Elliptic{T}}) where T <: Number
    Elliptic{T}(one(T), zero(T))
end

function one(::Elliptic{T}) where T <: Number
    one(Elliptic{T})
end

function (-)(z::Elliptic)
    Elliptic(-(z.l), -(z.r))
end

function conj(z::Elliptic)
    Elliptic(conj(z.l), -(z.r))
end

function (+)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    Elliptic{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::Elliptic{T}) where T <: Number
    Elliptic{T}(a + z.l, z.r)
end

function (+)(z::Elliptic{T}, a::T) where T <: Number
    Elliptic{T}(z.l + a, z.r)
end

function (+)(a::Real, z::Elliptic)
    l = a + z.l
    Elliptic(l, oftype(l, z.r))
end

function (+)(z::Elliptic, a::Real)
    l = z.l + a
    Elliptic(l, oftype(l, z.r))
end

function (-)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    Elliptic{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::Elliptic{T}) where T <: Number
    Elliptic{T}(a - z.l, -(z.r))
end

function (-)(z::Elliptic{T}, a::T) where T <: Number
    Elliptic{T}(z.l - a, z.r)
end

function (-)(a::Real, z::Elliptic)
    l = a - z.l
    Elliptic(l, -(oftype(l, z.r)))
end

function (-)(z::Elliptic, a::Real)
    l = z.l - a
    Elliptic(l, oftype(l, z.r))
end

function (*)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    Elliptic{T}(
        (x.l * y.l) - (conj(y.r) * x.r),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

function (*)(a::T, z::Elliptic{T}) where T <: Number
    Elliptic{T}(a * z.l, z.r * a)
end

function (*)(z::Elliptic{T}, a::T) where T <: Number
    Elliptic{T}(z.l * a, z.r * conj(a))
end

function (*)(a::Real, z::Elliptic)
    Elliptic(a * z.l, a * z.r)
end

function (*)(z::Elliptic, a::Real)
    Elliptic(z.l * a, z.r * a)
end

function (/)(z::Elliptic, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Elliptic(z.l / a, z.r / a)
end

function (\)(a::Real, z::Elliptic)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Elliptic(a \ z.l, a \ z.r)
end

function widen(::Type{Elliptic{T}}) where T
    Elliptic{widen(T)}
end

function float(::Type{Elliptic{T}}) where T <: AbstractFloat
    Elliptic{T}
end

function float(::Type{Elliptic{T}}) where T
    Elliptic{float(T)}
end
