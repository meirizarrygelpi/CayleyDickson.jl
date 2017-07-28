"""
    Construct{T <: Number} <: Number

An abstract Cayley-Dickson construct.
"""
abstract type Construct{T <: Number} <: Number end

"""
    array(z::Construct) -> Array

Return an array with all the `Real` components of `z`.
"""
function array(z::Construct)
    vcat(real(z), unreal(z))
end

"""
    iszero(z::Construct) -> Bool

Return `true` if all `Real` components of `z` are zero.
"""
function iszero(z::Construct)
    iszero(array(z))
end

"""
    isreal(z::Construct) -> Bool

Return `true` if the unreal part of `z` is zero.
"""
function isreal(z::Construct)
    iszero(unreal(z))
end

"""
    (+)(z::Construct)

The identity operation on Cayley-Dickson constructs.
"""
function (+)(z::Construct)
    z
end

"""
    commutator(x::Construct, y::Construct)

Measure the failure of commutativity of the multiplication operation:
```julia
    (x * y) - (y * x)
```
If `commutator(x, y)` is zero, then the multiplication operation is commutative.
"""
function commutator(x::Construct, y::Construct)
    (x * y) - (y * x)
end

"""
    anti_commutator(x::Construct, y::Construct)

Measure the failure of anti-commutativity of the multiplication operation:
```julia
    (x * y) + (y * x)
```
If `anti_commutator(x, y)` is zero, then the multiplication operation is anti-commutative.
"""
function anti_commutator(x::Construct, y::Construct)
    (x * y) + (y * x)
end

"""
    associator(x::Construct, y::Construct, z::Construct)

Measure the failure of associativity of the multiplication operation:
```julia
    ((x * y) * z) - (x * (y * z))
```
If `associator(x, y, z)` is zero, then the multiplication operation is associative.
"""
function associator(x::Construct, y::Construct, z::Construct)
    ((x * y) * z) - (x * (y * z))
end

"""
    anti_associator(x::Construct, y::Construct, z::Construct)

Measure the failure of anti-associativity of the multiplication operation:
```julia
    ((x * y) * z) + (x * (y * z))
```
If `anti_associator(x, y, z)` is zero, then the multiplication operation is anti-associative.
"""
function anti_associator(x::Construct, y::Construct, z::Construct)
    ((x * y) * z) + (x * (y * z))
end

"""
    jacobiator(x::Construct, y::Construct, z::Construct)

Measure the failure of the multiplication operation to satisfy the Jacobi identity:
```julia
    ((x * y) * z) + ((z * x) * y) + ((y * z) * x)
```
If `jacobiator(x, y, z)` is zero, then the multiplication operation satisfies the Jacobi
identity.
"""
function jacobiator(x::Construct, y::Construct, z::Construct)
    ((x * y) * z) + ((z * x) * y) + ((y * z) * x)
end

"""
    alternatorL(x::Construct, y::Construct)

Measure the failure of the multiplication operation to be left-alternative:
```julia
    ((x * x) * y) - (x * (x * y))
```
If `alternatorL(x, y)` is zero, then the multiplication operation is left-alternative.
"""
function alternatorL(x::Construct, y::Construct)
    associator(x, x, y)
end

"""
    anti_alternatorL(x::Construct, y::Construct)

Measure the failure of the multiplication operation to be anti-left-alternative:
```julia
    ((x * x) * y) + (x * (x * y))
```
If `anti_alternatorL(x, y)` is zero, then the multiplication operation is anti-left-alternative.
"""
function anti_alternatorL(x::Construct, y::Construct)
    anti_associator(x, x, y)
end

"""
    alternatorR(x::Construct, y::Construct)

Measure the failure of the multiplication operation to be right-alternative:
```julia
    ((x * y) * y) - (x * (y * y))
```
If `alternatorR(x, y)` is zero, then the multiplication operation is right-alternative.
"""
function alternatorR(x::Construct, y::Construct)
    associator(x, y, y)
end

"""
    anti_alternatorR(x::Construct, y::Construct)

Measure the failure of the multiplication operation to be anti-right-alternative:
```julia
    ((x * y) * y) + (x * (y * y))
```
If `anti_alternatorR(x, y)` is zero, then the multiplication operation is anti-right-alternative.
"""
function anti_alternatorR(x::Construct, y::Construct)
    anti_associator(x, y, y)
end

"""
    flexator(x::Construct, y::Construct)

Measure the failure of the multiplication operation to be flexible:
```julia
    ((x * y) * x) - (x * (y * x))
```
If `flexator(x, y)` is zero, then the multiplication operation is flexible.
"""
function flexator(x::Construct, y::Construct)
    associator(x, y, x)
end

"""
    anti_flexator(x::Construct, y::Construct)

Measure the failure of the multiplication operation to be anti-flexible:
```julia
    ((x * y) * x) + (x * (y * x))
```
If `anti_flexator(x, y)` is zero, then the multiplication operation is anti-flexible.
"""
function anti_flexator(x::Construct, y::Construct)
    anti_associator(x, y, x)
end

"""
    inv(z::Construct)

Return the multiplicative inverse of a Cayley-Dickson construct.
If `z` is a zero divisor, then an `ErrorException` is thrown.
"""
function inv(z::Construct)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    conj(z) / abs2(z)
end

"""
    (/)(x::Construct, y::Construct)

Naive right quotient of two Cayley-Dickson constructs.
Equivalent to multiplying `x` on the right by the inverse of `y`.
"""
function (/)(x::Construct, y::Construct)
    x * inv(y)
end

"""
    (\\)(y::Construct, x::Construct)

Naive left quotient of two Cayley-Dickson constructs.
Equivalent to multiplying `x` on the left by the inverse of `y`.
"""
function (\)(y::Construct, x::Construct)
    inv(y) * x
end

"""
    (/)(a::Real, z::Construct)

Equivalent to multiplying the inverse of `z` by `a`.
"""
function (/)(a::Real, z::Construct)
    a * inv(z)
end

"""
    (\\)(z::Construct, a::Real)

Equivalent to multiplying the inverse of `z` by `a`.
"""
function (\)(z::Construct, a::Real)
    inv(z) * a
end

"""
    convert(::Type{T}, z::Construct) where T <: Real

Convert a Cayley-Dickson construct to a real number.
If `z` is not real (i.e. has non-zero unreal part), then an `InexactError` is
thrown.
"""
function convert(::Type{T}, z::Construct) where T <: Real
    if !isreal(z)
        throw(InexactError())
    end

    convert(T, real(z))
end

"""
    convert(::Type{T}, z::T) where T <: Construct

The trivial conversion. Equivalent to the identity operation.
"""
function convert(::Type{T}, z::T) where T <: Construct
    z
end

"""
    convert(::Type{T}, a::Real) where T <: Construct

Convert a real number into a Cayley-Dickson construct.
"""
function convert(::Type{T}, a::Real) where T <: Construct
    T(a)
end
