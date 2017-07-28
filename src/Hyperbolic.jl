"""
    Hyperbolic{T <: Number} <: Construct{T}

A hyperbolic Cayley-Dickson construct as a pair.
"""
struct Hyperbolic{T <: Number} <: Construct{T}
    l::T
    r::T
end

function (==)(x::Hyperbolic, y::Hyperbolic)
    x.l == y.l && x.r == y.r
end

function real(z::Hyperbolic)
    real(z.l)
end

"""
    quadrance(z::CayleyDickson.Hyperbolic)

For hyperbolic Cayley-Dickson constructs, return the difference of the squared
absolute value of the left and right components of `z`.
Note that this can be positive, negative, or zero.
"""
function quadrance(z::Hyperbolic)
    quadrance(z.l) - quadrance(z.r)
end

function iszerodivisor(z::Hyperbolic)
    quadrance(z.l) == quadrance(z.r)
end

function zero(::Type{Hyperbolic{T}}) where T <: Number
    Hyperbolic{T}(zero(T), zero(T))
end

function zero(::Hyperbolic{T}) where T <: Number
    zero(Hyperbolic{T})
end

function one(::Type{Hyperbolic{T}}) where T <: Number
    Hyperbolic{T}(one(T), zero(T))
end

function one(::Hyperbolic{T}) where T <: Number
    one(Hyperbolic{T})
end

function (-)(z::Hyperbolic)
    Hyperbolic(-(z.l), -(z.r))
end

function conj(z::Hyperbolic)
    Hyperbolic(conj(z.l), -(z.r))
end

function (+)(x::Hyperbolic{T}, y::Hyperbolic{T}) where T <: Number
    Hyperbolic{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::Hyperbolic{T}) where T <: Number
    Hyperbolic{T}(a + z.l, z.r)
end

function (+)(z::Hyperbolic{T}, a::T) where T <: Number
    Hyperbolic{T}(z.l + a, z.r)
end

function (+)(a::Real, z::Hyperbolic)
    l = a + z.l
    Hyperbolic(l, oftype(l, z.r))
end

function (+)(z::Hyperbolic, a::Real)
    l = z.l + a
    Hyperbolic(l, oftype(l, z.r))
end

function (-)(x::Hyperbolic{T}, y::Hyperbolic{T}) where T <: Number
    Hyperbolic{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::Hyperbolic{T}) where T <: Number
    Hyperbolic{T}(a - z.l, -(z.r))
end

function (-)(z::Hyperbolic{T}, a::T) where T <: Number
    Hyperbolic{T}(z.l - a, z.r)
end

function (-)(a::Real, z::Hyperbolic)
    l = a - z.l
    Hyperbolic(l, -(oftype(l, z.r)))
end

function (-)(z::Hyperbolic, a::Real)
    l = z.l - a
    Hyperbolic(l, oftype(l, z.r))
end

function (*)(x::Hyperbolic{T}, y::Hyperbolic{T}) where T <: Number
    Hyperbolic{T}(
        (x.l * y.l) + (conj(y.r) * x.r),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

function (*)(a::T, z::Hyperbolic{T}) where T <: Number
    Hyperbolic{T}(a * z.l, z.r * a)
end

function (*)(z::Hyperbolic{T}, a::T) where T <: Number
    Hyperbolic{T}(z.l * a, z.r * conj(a))
end

function (*)(a::Real, z::Hyperbolic)
    Hyperbolic(a * z.l, a * z.r)
end

function (*)(z::Hyperbolic, a::Real)
    Hyperbolic(z.l * a, z.r * a)
end

function (/)(z::Hyperbolic, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Hyperbolic(z.l / a, z.r / a)
end

function (\)(a::Real, z::Hyperbolic)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Hyperbolic(a \ z.l, a \ z.r)
end

function widen(::Type{Hyperbolic{T}}) where T
    Hyperbolic{widen(T)}
end

function float(::Type{Hyperbolic{T}}) where T <: AbstractFloat
    Hyperbolic{T}
end

function float(::Type{Hyperbolic{T}}) where T
    Hyperbolic{float(T)}
end

"""
    cloak(a::Hyperbolic)

For hyperbolic Cayley-Dickson constructs, equivalent to the minus operation.
"""
function cloak(a::Hyperbolic)
    -(a)
end

"""
    dagger(a::Hyperbolic)

For hyperbolic Cayley-Dickson constructs, equivalent to the identity operation.
"""
function dagger(a::Hyperbolic)
    a
end

"""
    star(a::Hyperbolic)

For hyperbolic Cayley-Dickson constructs, the identity operation.
"""
function star(a::Hyperbolic)
    a
end
