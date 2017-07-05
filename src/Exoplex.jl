"""
    Exoplex{T <: Real} = ParabolicCD{T}

An exoplex number is a parabolic Cayley-Dickson construct with real numbers.
"""
const Exoplex{T <: Real} = ParabolicCD{T}

function Exoplex(a::T, b::T) where T <: Real
    Exoplex{T}(a, b)
end

function Exoplex(a::T) where T <: Real
    Exoplex{T}(a, zero(T))
end

function Exoplex(a::Real, b::Real)
    Exoplex(promote(a, b)...)
end

function cloak(z::Exoplex{T}) where T <: Real
    Exoplex{T}(-(z.l), z.r)
end

function dagger(z::Exoplex{T}) where T <: Real
    Exoplex{T}(z.l, -(z.r))
end

function star(z::Exoplex{T}) where T <: Real
    Exoplex{T}(z.r, z.l)
end

function selfstar(z::Exoplex)
    (z + star(z)) / 2
end

function antiselfstar(z::Exoplex)
    (z - star(z)) / 2
end

"""
    unreal(z::Exoplex)

The unreal part of an exoplex number is a 1-vector.
"""
function unreal(z::Exoplex{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Exoplex)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", A: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Exoplex{T}}) where T <: Real
    Exoplex{T}(rand(T), rand(T))
end

function random(::Type{Exoplex{BigInt}})
    Exoplex{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Exoplex{BigFloat}})
    Exoplex{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Exoplex{Rational{BigInt}}})
    Exoplex{Rational{BigInt}}(randomBigRational(), randomBigRational())
end
