"""
    CDConstruct{T <: Number} <: Number

An abstract Cayley-Dickson construct.
"""
abstract type CDConstruct{T <: Number} <: Number end

"""
    unreal(::T) where T <: Real

The unreal part of a real number is an empty array.
"""
function unreal(::T) where T <: Real
    T[]
end

"""
    asarray(z::CDConstruct) -> Array

Return an array with all the `Real` components of `z`.
"""
function asarray(z::CDConstruct)
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
    iszero(z::CDConstruct) -> Bool

Return `true` if all `Real` components of `z` are zero.
"""
function iszero(z::CDConstruct)
    iszero(asarray(z))
end

"""
    isreal(z::CDConstruct) -> Bool

Return `true` if the unreal part of `z` is zero.
"""
function isreal(z::CDConstruct)
    iszero(unreal(z))
end

"""
    (+)(z::CDConstruct)

The identity operation on Cayley-Dickson constructs.
"""
function (+)(z::CDConstruct)
    z
end

"""
    commutator(x::CDConstruct, y::CDConstruct)

Measure the failure of commutativity of the multiplication operation:
```julia
    (x * y) - (y * x)
```
If `commutator(x, y)` is zero, then the multiplication operation is commutative.
"""
function commutator(x::CDConstruct, y::CDConstruct)
    (x * y) - (y * x)
end

"""
    associator(x::CDConstruct, y::CDConstruct, z::CDConstruct)

Measure the failure of associativity of the multiplication operation:
```julia
    ((x * y) * z) - (x * (y * z))
```
If `associator(x, y, z)` is zero, then the multiplication operation is associative.
"""
function associator(x::CDConstruct, y::CDConstruct, z::CDConstruct)
    ((x * y) * z) - (x * (y * z))
end

"""
    jacobiator(x::CDConstruct, y::CDConstruct, z::CDConstruct)

Measure the failure of the multiplication operation to satisfy the Jacobi identity:
```julia
    ((x * y) * z) + ((z * x) * y) + ((y * z) * x)
```
If `jacobiator(x, y, z)` is zero, then the multiplication operation satisfies the Jacobi
identity.
"""
function jacobiator(x::CDConstruct, y::CDConstruct, z::CDConstruct)
    ((x * y) * z) + ((z * x) * y) + ((y * z) * x)
end

"""
    alternatorL(x::CDConstruct, y::CDConstruct)

Measure the failure of the multiplication operation to be left-alternative:
```julia
    ((x * x) * y) - (x * (x * y))
```
If `alternatorL(x, y)` is zero, then the multiplication operation is left-alternative.
"""
function alternatorL(x::CDConstruct, y::CDConstruct)
    associator(x, x, y)
end

"""
    alternatorR(x::CDConstruct, y::CDConstruct)

Measure the failure of the multiplication operation to be right-alternative:
```julia
    ((x * y) * y) - (x * (y * y))
```
If `alternatorR(x, y)` is zero, then the multiplication operation is right-alternative.
"""
function alternatorR(x::CDConstruct, y::CDConstruct)
    associator(x, y, y)
end

"""
    inv(z::CDConstruct)

Return the multiplicative inverse of a Cayley-Dickson construct.
If `z` is a zero divisor, then an `ErrorException` is thrown.
"""
function inv(z::CDConstruct)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    conj(z) / abs2(z)
end

"""
    (/)(x::CDConstruct, y::CDConstruct)

Naive right quotient of two Cayley-Dickson constructs.
Equivalent to multiplying `x` on the right by the inverse of `y`.
"""
function (/)(x::CDConstruct, y::CDConstruct)
    x * inv(y)
end

"""
    (\\)(y::CDConstruct, x::CDConstruct)

Naive left quotient of two Cayley-Dickson constructs.
Equivalent to multiplying `x` on the left by the inverse of `y`.
"""
function (\)(y::CDConstruct, x::CDConstruct)
    inv(y) * x
end

"""
    (/)(a::Real, z::CDConstruct)

Equivalent to multiplying the inverse of `z` by `a`.
"""
function (/)(a::Real, z::CDConstruct)
    a * inv(z)
end

"""
    (\\)(z::CDConstruct, a::Real)

Equivalent to multiplying the inverse of `z` by `a`.
"""
function (\)(z::CDConstruct, a::Real)
    inv(z) * a
end
