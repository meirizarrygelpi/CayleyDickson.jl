"""
    Parabolic{T <: Number} <: Construct{T}

A parabolic Cayley-Dickson construct as a pair of `Number`s.
"""
struct Parabolic{T <: Number} <: Construct{T}
    l::T
    r::T
end

function (==)(x::Parabolic, y::Parabolic)
    x.l == y.l && x.r == y.r
end

function real(z::Parabolic)
    real(z.l)
end

"""
    abs2(z::CayleyDickson.Parabolic)

For parabolic Cayley-Dickson constructs, return the squared absolute value of the
left component of `z`. Depending on the type of the components of `z`, this can
either be non-negative, or positive, negative or zero.
"""
function abs2(z::Parabolic)
    abs2(z.l)
end

function iszerodivisor(z::Parabolic)
    iszerodivisor(z.l)
end

function zero(::Type{Parabolic{T}}) where T <: Number
    Parabolic{T}(zero(T), zero(T))
end

function zero(::Parabolic{T}) where T <: Number
    zero(Parabolic{T})
end

function one(::Type{Parabolic{T}}) where T <: Number
    Parabolic{T}(one(T), zero(T))
end

function one(::Parabolic{T}) where T <: Number
    one(Parabolic{T})
end

function (-)(z::Parabolic)
    Parabolic(-(z.l), -(z.r))
end

function conj(z::Parabolic)
    Parabolic(conj(z.l), -(z.r))
end

function (+)(x::Parabolic{T}, y::Parabolic{T}) where T <: Number
    Parabolic{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::Parabolic{T}) where T <: Number
    Parabolic{T}(a + z.l, z.r)
end

function (+)(z::Parabolic{T}, a::T) where T <: Number
    Parabolic{T}(z.l + a, z.r)
end

function (+)(a::Real, z::Parabolic)
    l = a + z.l
    Parabolic(l, oftype(l, z.r))
end

function (+)(z::Parabolic, a::Real)
    l = z.l + a
    Parabolic(l, oftype(l, z.r))
end

function (-)(x::Parabolic{T}, y::Parabolic{T}) where T <: Number
    Parabolic{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::Parabolic{T}) where T <: Number
    Parabolic{T}(a - z.l, -(z.r))
end

function (-)(z::Parabolic{T}, a::T) where T <: Number
    Parabolic{T}(z.l - a, z.r)
end

function (-)(a::Real, z::Parabolic)
    l = a - z.l
    Parabolic(l, -(oftype(l, z.r)))
end

function (-)(z::Parabolic, a::Real)
    l = z.l - a
    Parabolic(l, oftype(l, z.r))
end

function (*)(x::Parabolic{T}, y::Parabolic{T}) where T <: Number
    Parabolic{T}(
        (x.l * y.l),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

function (*)(a::T, z::Parabolic{T}) where T <: Number
    Parabolic{T}(a * z.l, z.r * a)
end

function (*)(z::Parabolic{T}, a::T) where T <: Number
    Parabolic{T}(z.l * a, z.r * conj(a))
end

function (*)(a::Real, z::Parabolic)
    Parabolic(a * z.l, a * z.r)
end

function (*)(z::Parabolic, a::Real)
    Parabolic(z.l * a, z.r * a)
end

function (/)(z::Parabolic, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Parabolic(z.l / a, z.r / a)
end

function (\)(a::Real, z::Parabolic)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Parabolic(a \ z.l, a \ z.r)
end

function widen(::Type{Parabolic{T}}) where T
    Parabolic{widen(T)}
end

function float(::Type{Parabolic{T}}) where T <: AbstractFloat
    Parabolic{T}
end

function float(::Type{Parabolic{T}}) where T
    Parabolic{float(T)}
end

function cloak(z::Parabolic)
    Parabolic(cloak(z.l), dagger(z.r))
end

function dagger(z::Parabolic)
    Parabolic(dagger(z.l), cloak(z.r))
end

function star(z::Parabolic)
    Parabolic(dagger(star(z.r)), star(z.l))
end
