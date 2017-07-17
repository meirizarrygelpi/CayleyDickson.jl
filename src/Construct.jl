"""
    Construct{T <: Number} <: Number

An abstract Cayley-Dickson construct.
"""
abstract type Construct{T <: Number} <: Number end

"""
    unreal(::T) where T <: Real

The unreal part of a real number is an empty array.
"""
function unreal(::T) where T <: Real
    T[]
end

"""
    array(z::Construct) -> Array

Return an array with all the `Real` components of `z`.
"""
function array(z::Construct)
    vcat(real(z), unreal(z))
end

"""
    iszerodivisor(a::Real) -> Bool

Return `true` if a is zero. Equivalent to `iszero(a)`.
"""
function iszerodivisor(a::Real)
    iszero(a)
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
