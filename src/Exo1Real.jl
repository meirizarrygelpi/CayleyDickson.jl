"""
    Exo1Real{T <: Real} = Parabolic{T}

A 1-exo-real number is a parabolic Cayley-Dickson construct with real numbers.
"""
const Exo1Real{T <: Real} = Parabolic{T}

function Exo1Real(a::T, b::T) where T <: Real
    Exo1Real{T}(a, b)
end

function Exo1Real(a::T) where T <: Real
    Exo1Real{T}(a, zero(T))
end

function Exo1Real(a::Real, b::Real)
    Exo1Real(promote(a, b)...)
end

function cloak(z::Exo1Real{T}) where T <: Real
    Exo1Real{T}(-(z.l), z.r)
end

function dagger(z::Exo1Real{T}) where T <: Real
    Exo1Real{T}(z.l, -(z.r))
end

function star(z::Exo1Real{T}) where T <: Real
    Exo1Real{T}(z.r, z.l)
end

function selfstar(z::Exo1Real)
    (z + star(z)) / 2
end

function anti_selfstar(z::Exo1Real)
    (z - star(z)) / 2
end

"""
    unreal(z::Exo1Real)

The unreal part of a 1-exo-real number is a 1-vector.
"""
function unreal(z::Exo1Real{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Exo1Real)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", a: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Exo1Real{T}}) where T <: Real
    Exo1Real{T}(rand(T), rand(T))
end

function random(::Type{Exo1Real{BigInt}})
    Exo1Real{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Exo1Real{BigFloat}})
    Exo1Real{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Exo1Real{Rational{BigInt}}})
    Exo1Real{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function convert(::Type{Exo1Real{T}}, a::Real) where T <: Real
    Exo1Real{T}(a, zero(T))
end

function convert(::Type{Exo1Real{T}}, z::Exo1Real) where T <: Real
    Exo1Real{T}(z.l, z.r)
end

function promote_rule(::Type{Exo1Real{T}}, ::Type{S}) where {T <: Real, S <: Real}
    Exo1Real{promote_type(T, S)}
end

function promote_rule(::Type{Exo1Real{T}}, ::Type{Exo1Real{S}}) where {T <: Real, S <: Real}
    Exo1Real{promote_type(T, S)}
end
