"""
    unreal(::T) where T <: Real

For real numbers, return an empty array of type `T`.
"""
function unreal(::T) where T <: Real
    T[]
end

"""
    iszerodivisor(a::Real) -> Bool

For real numbers, return `true` if `a` is zero. Equivalent to `iszero(a)`.
"""
function iszerodivisor(a::Real)
    iszero(a)
end

"""
    cloak(a::Real)

For real numbers, equivalent to the minus operation.
"""
function cloak(a::Real)
    -(a)
end

"""
    dagger(a::Real)

For real numbers, equivalent to the identity operation.
"""
function dagger(a::Real)
    a
end

"""
    star(a::Real)

For real numbers, the identity operation.
"""
function star(a::Real)
    a
end

"""
    quadrance(a::Real)

For real numbers, the squared absolute value.
"""
function quadrance(a::Real)
    abs2(a)
end
