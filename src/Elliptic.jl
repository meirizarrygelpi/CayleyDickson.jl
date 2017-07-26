"""
    Elliptic{T <: Number} <: Construct{T}

An elliptic Cayley-Dickson construct as a pair.
Elliptic constructs use the elliptic multiplication operation.
Examples of elliptic Cayley-Dickson constructs are binions (complex numbers), quaternions,
octonions, and sedenions.
"""
struct Elliptic{T <: Number} <: Construct{T}
    l::T
    r::T
end

"""
    (==)(x::CayleyDickson.Elliptic, y::CayleyDickson.Elliptic)
    (==)(x::CayleyDickson.Parabolic, y::CayleyDickson.Parabolic)
    (==)(x::CayleyDickson.Hyperbolic, y::CayleyDickson.Hyperbolic)

Return true if the left components of `x` and `y` are equal,
and also the right components of `x` and `y` are equal.
"""
function (==)(x::Elliptic, y::Elliptic)
    x.l == y.l && x.r == y.r
end

"""
    real(z::CayleyDickson.Elliptic)
    real(z::CayleyDickson.Parabolic)
    real(z::CayleyDickson.Hyperbolic)
For Cayley-Dickson constructs, return the real part of `z`.
This is equivalent to the real part of the left component of `z`.
"""
function real(z::Elliptic)
    real(z.l)
end

"""
    abs2(z::CayleyDickson.Elliptic)

For elliptic Cayley-Dickson constructs, return the sum of the squared absolute value of the
left and right components of `z`. Note that this is always non-negative.

For the `Binion`, `Quaternion`, and `Octonion` types, `abs2(z)` satisfies the composition
property:
```math
    abs2(x * y) == abs2(x) * abs2(y)
```
The composition property does not hold true for the `Sedenion` type.
"""
function abs2(z::Elliptic)
    abs2(z.l) + abs2(z.r)
end

"""
    iszerodivisor(z::CayleyDickson.Elliptic)

For `Binion`, `Quaternion`, and `Octonion` types, return `true` if `z` is zero.
"""
function iszerodivisor(z::Elliptic)
    iszero(z)
end

"""
    zero(::Type{CayleyDickson.Elliptic{T}}) where T <: Number
    zero(::Type{CayleyDickson.Parabolic{T}}) where T <: Number
    zero(::Type{CayleyDickson.Hyperbolic{T}}) where T <: Number

For Cayley-Dickson construct types, return a Cayley-Dickson
construct consisting of both left and right components being zero of type `T`.
"""
function zero(::Type{Elliptic{T}}) where T <: Number
    Elliptic{T}(zero(T), zero(T))
end

"""
    zero(::CayleyDickson.Elliptic{T}) where T <: Number
    zero(::CayleyDickson.Parabolic{T}) where T <: Number
    zero(::CayleyDickson.Hyperbolic{T}) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson
construct consisting of both left and right components being zero of type `T`.
"""
function zero(::Elliptic{T}) where T <: Number
    zero(Elliptic{T})
end

"""
    one(::Type{CayleyDickson.Elliptic{T}}) where T <: Number
    one(::Type{CayleyDickson.Parabolic{T}}) where T <: Number
    one(::Type{CayleyDickson.Hyperbolic{T}}) where T <: Number

For Cayley-Dickson construct types, return a Cayley-Dickson
construct where the left component is one of type `T`, and the right component
is zero of type `T`.
"""
function one(::Type{Elliptic{T}}) where T <: Number
    Elliptic{T}(one(T), zero(T))
end

"""
    one(::CayleyDickson.Elliptic{T}) where T <: Number
    one(::CayleyDickson.Parabolic{T}) where T <: Number
    one(::CayleyDickson.Hyperbolic{T}) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson
construct where the left component is one of type `T`, and the right component
is zero of type `T`.
"""
function one(::Elliptic{T}) where T <: Number
    one(Elliptic{T})
end

"""
    (-)(z::CayleyDickson.Elliptic)
    (-)(z::CayleyDickson.Parabolic)
    (-)(z::CayleyDickson.Hyperbolic)

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
minus the left component of `z`, and the right component is minus the right component of
`z`.
"""
function (-)(z::Elliptic)
    Elliptic(-(z.l), -(z.r))
end

"""
    conj(z::CayleyDickson.Elliptic)
    conj(z::CayleyDickson.Parabolic)
    conj(z::CayleyDickson.Hyperbolic)

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the conjugate of the left component of `z`, and the right component is minus the right component of `z`.
"""
function conj(z::Elliptic)
    Elliptic(conj(z.l), -(z.r))
end

"""
    (+)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    (+)(x::Parabolic{T}, y::Parabolic{T}) where T <: Number
    (+)(x::Hyperbolic{T}, y::Hyperbolic{T}) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the sum of the left components of `x` and `y`, and the right component is the sum of the
right components of `x` and `y`.
"""
function (+)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    Elliptic{T}(x.l + y.l, x.r + y.r)
end

"""
    (+)(a::T, z::Elliptic{T}) where T <: Number
    (+)(z::Elliptic{T}, a::T) where T <: Number
    (+)(a::T, z::Parabolic{T}) where T <: Number
    (+)(z::Parabolic{T}, a::T) where T <: Number
    (+)(a::T, z::Hyperbolic{T}) where T <: Number
    (+)(z::Hyperbolic{T}, a::T) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the sum of `a` and the left component of `z`, and the right component is the right component
of `z`. Note that `a` is of the same type as the components of `z`.
"""
function (+)(a::T, z::Elliptic{T}) where T <: Number
    Elliptic{T}(a + z.l, z.r)
end

function (+)(z::Elliptic{T}, a::T) where T <: Number
    Elliptic{T}(z.l + a, z.r)
end

"""
    (+)(a::Real, z::Elliptic)
    (+)(z::Elliptic, a::Real)
    (+)(a::Real, z::Parabolic)
    (+)(z::Parabolic, a::Real)
    (+)(a::Real, z::Hyperbolic)
    (+)(z::Hyperbolic, a::Real)

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the sum of `a` and the left component of `z`, and the right component is the right component
of `z` converted to the same type as the left component of the result.
Note that `a` is not necessarily of the same type as the real components of `z`.
"""
function (+)(a::Real, z::Elliptic)
    l = a + z.l
    Elliptic(l, oftype(l, z.r))
end

function (+)(z::Elliptic, a::Real)
    l = z.l + a
    Elliptic(l, oftype(l, z.r))
end

"""
    (-)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    (-)(x::Parabolic{T}, y::Parabolic{T}) where T <: Number
    (-)(x::Hyperbolic{T}, y::Hyperbolic{T}) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the differemce of the left components of `x` and `y`, and the right component is the
differemce of the right components of `x` and `y`.
"""
function (-)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    Elliptic{T}(x.l - y.l, x.r - y.r)
end

"""
    (-)(a::T, z::Elliptic{T}) where T <: Number
    (-)(a::T, z::Parabolic{T}) where T <: Number
    (-)(a::T, z::Hyperbolic{T}) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the difference of `a` and the left component of `z`, and the right component is minus the
right component of `z`. Note that `a` is of the same type as the components of `z`.
"""
function (-)(a::T, z::Elliptic{T}) where T <: Number
    Elliptic{T}(a - z.l, -(z.r))
end

"""
    (-)(z::Elliptic{T}, a::T) where T <: Number
    (-)(z::Parabolic{T}, a::T) where T <: Number
    (-)(z::Hyperbolic{T}, a::T) where T <: Number

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the difference of the left component of `z` and `a`, and the right component is the right
component of `z`. Note that `a` is of the same type as the components of `z`.
"""
function (-)(z::Elliptic{T}, a::T) where T <: Number
    Elliptic{T}(z.l - a, z.r)
end

"""
    (-)(a::Real, z::Elliptic)
    (-)(a::Real, z::Parabolic)
    (-)(a::Real, z::Hyperbolic)

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the difference of `a` and the left component of `z`, and the right component is minus the
right component of `z` converted to the same type as the left component of the result. Note
that `a` and the components of `z` are not necessarily of the same type.
"""
function (-)(a::Real, z::Elliptic)
    l = a - z.l
    Elliptic(l, -(oftype(l, z.r)))
end

"""
    (-)(z::Elliptic, a::Real)
    (-)(z::Parabolic, a::Real)
    (-)(z::Hyperbolic, a::Real)

For Cayley-Dickson constructs, return a Cayley-Dickson construct where the left component is
the difference of the left component of `z` and `a`, and the right component is the right
component of `z` converted to the same type as the left component of the result. Note
that `a` and the components of `z` are not necessarily of the same type.
"""
function (-)(z::Elliptic, a::Real)
    l = z.l - a
    Elliptic(l, oftype(l, z.r))
end

"""
    (*)(x::Elliptic{T}, y::Elliptic{T})

For elliptic Cayley-Dickson constructs, the elliptic multiplication operation.

The elliptic multiplication of two `Binion` types is commutative and associative.

The elliptic multiplication of two `Quaternion` types is non-commutative but associative.

The elliptic multiplication of two `Octonion` types is non-commutative, non-associative,
but alternative.

The elliptic multiplication of two `Sedenion` types is non-commutative, non-associative,
non-alternative but flexible.
"""
function (*)(x::Elliptic{T}, y::Elliptic{T}) where T <: Number
    Elliptic{T}(
        (x.l * y.l) - (conj(y.r) * x.r),
        (y.r * x.l) + (x.r * conj(y.l))
    )
end

"""
    (*)(a::T, z::Elliptic{T}) where T <: Number
    (*)(z::Elliptic{T}, a::T) where T <: Number
    (*)(a::T, z::Parabolic{T}) where T <: Number
    (*)(z::Parabolic{T}, a::T) where T <: Number
    (*)(a::T, z::Hyperbolic{T}) where T <: Number
    (*)(z::Hyperbolic{T}, a::T) where T <: Number
"""
function (*)(a::T, z::Elliptic{T}) where T <: Number
    Elliptic{T}(a * z.l, z.r * a)
end

function (*)(z::Elliptic{T}, a::T) where T <: Number
    Elliptic{T}(z.l * a, z.r * conj(a))
end

"""
    (*)(a::Real, z::Elliptic)
    (*)(z::Elliptic, a::Real)
    (*)(a::Real, z::Parabolic)
    (*)(z::Parabolic, a::Real)
    (*)(a::Real, z::Hyperbolic)
    (*)(z::Hyperbolic, a::Real)
"""
function (*)(a::Real, z::Elliptic)
    Elliptic(a * z.l, a * z.r)
end

function (*)(z::Elliptic, a::Real)
    Elliptic(z.l * a, z.r * a)
end

"""
    (/)(z::Elliptic, a::Real)
    (/)(z::Parabolic, a::Real)
    (/)(z::Hyperbolic, a::Real)
"""
function (/)(z::Elliptic, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Elliptic(z.l / a, z.r / a)
end

"""
    (\\)(a::Real, z::Elliptic)
    (\\)(a::Real, z::Parabolic)
    (\\)(a::Real, z::Hyperbolic)
"""
function (\)(a::Real, z::Elliptic)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Elliptic(a \ z.l, a \ z.r)
end

"""
    widen(::Type{Elliptic{T}}) where T
    widen(::Type{Parabolic{T}}) where T
    widen(::Type{Hyperbolic{T}}) where T

For Cayley-Dickson construct types, return a wider Cayley-Dickson construct type.
"""
function widen(::Type{Elliptic{T}}) where T
    Elliptic{widen(T)}
end

"""
    float(::Type{Elliptic{T}}) where T <: AbstractFloat
    float(::Type{Parabolic{T}}) where T <: AbstractFloat
    float(::Type{Hyperbolic{T}}) where T <: AbstractFloat

For Cayley-Dickson construct of floating-point types, this is equivalent to the identity
operation. 
"""
function float(::Type{Elliptic{T}}) where T <: AbstractFloat
    Elliptic{T}
end

"""
    float(::Type{Elliptic{T}}) where T
    float(::Type{Parabolic{T}}) where T
    float(::Type{Hyperbolic{T}}) where T

For Cayley-Dickson construct types, return an appropriate floating-point type to represent a
given Cayley-Dickson construct type.
"""
function float(::Type{Elliptic{T}}) where T
    Elliptic{float(T)}
end
