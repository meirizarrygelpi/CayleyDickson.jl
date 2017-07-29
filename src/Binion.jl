"""
    Binion{T <: Real} = Elliptic{T}

A binion is an elliptic Cayley-Dickson construct with real numbers.
"""
const Binion{T <: Real} = Elliptic{T}

function Binion(a::T, b::T) where T <: Real
    Binion{T}(a, b)
end

function Binion(a::T) where T <: Real
    Binion{T}(a, zero(T))
end

function Binion(a::Real, b::Real)
    Binion(promote(a, b)...)
end

"""
    unreal(z::Binion)

The unreal part of a complex number is a 1-vector.
"""
function unreal(z::Binion{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Binion)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", i: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Binion{T}}) where T <: Real
    Binion{T}(rand(T), rand(T))
end

function random(::Type{Binion{BigInt}})
    Binion{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Binion{BigFloat}})
    Binion{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Binion{Rational{BigInt}}})
    Binion{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function convert(::Type{Binion{T}}, a::Real) where T <: Real
    Binion{T}(a, zero(T))
end

function convert(::Type{Binion{T}}, z::Binion) where T <: Real
    Binion{T}(z.l, z.r)
end

function promote_rule(::Type{Binion{T}}, ::Type{S}) where {T <: Real, S <: Real}
    Binion{promote_type(T, S)}
end

function promote_rule(::Type{Binion{T}}, ::Type{Binion{S}}) where {T <: Real, S <: Real}
    Binion{promote_type(T, S)}
end

function selfstar(z::Binion)
    (z + star(z)) / 2
end

function anti_selfstar(z::Binion)
    (z - star(z)) / 2
end
