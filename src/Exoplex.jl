"""
    Exoplex{T <: Real} = Parabolic{T}

An exoplex number is a parabolic Cayley-Dickson construct with real numbers.
"""
const Exoplex{T <: Real} = Parabolic{T}

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

function anti_selfstar(z::Exoplex)
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
    print(io, ", a: ")
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

function convert(::Type{Exoplex{T}}, a::Real) where T <: Real
    Exoplex{T}(a, zero(T))
end

function convert(::Type{Exoplex{T}}, z::Exoplex) where T <: Real
    Exoplex{T}(z.l, z.r)
end

function promote_rule(::Type{Exoplex{T}}, ::Type{S}) where {T <: Real, S <: Real}
    Exoplex{promote_type(T, S)}
end

function promote_rule(::Type{Exoplex{T}}, ::Type{Exoplex{S}}) where {T <: Real, S <: Real}
    Exoplex{promote_type(T, S)}
end
