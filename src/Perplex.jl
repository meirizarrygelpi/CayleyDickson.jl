"""
    Perplex{T <: Real} = Hyperbolic{T}

A perplex number is a hyperbolic Cayley-Dickson construct with real numbers.
"""
const Perplex{T <: Real} = Hyperbolic{T}

function Perplex(a::T, b::T) where T <: Real
    Perplex{T}(a, b)
end

function Perplex(a::T) where T <: Real
    Perplex{T}(a, zero(T))
end

function Perplex(a::Real, b::Real)
    Perplex(promote(a, b)...)
end

"""
    unreal(z::Perplex)

The unreal part of a perplex number is a 1-vector.
"""
function unreal(z::Perplex{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Perplex)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", s: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Perplex{T}}) where T <: Real
    Perplex{T}(rand(T), rand(T))
end

function random(::Type{Perplex{BigInt}})
    Perplex{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Perplex{BigFloat}})
    Perplex{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Perplex{Rational{BigInt}}})
    Perplex{Rational{BigInt}}(randomBigRational(), randomBigRational())
end
