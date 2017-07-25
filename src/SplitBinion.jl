"""
    SplitBinion{T <: Real} = Hyperbolic{T}

A split-binion is a hyperbolic Cayley-Dickson construct with real numbers.
"""
const SplitBinion{T <: Real} = Hyperbolic{T}

function SplitBinion(a::T, b::T) where T <: Real
    SplitBinion{T}(a, b)
end

function SplitBinion(a::T) where T <: Real
    SplitBinion{T}(a, zero(T))
end

function SplitBinion(a::Real, b::Real)
    SplitBinion(promote(a, b)...)
end

"""
    unreal(z::SplitBinion)

The unreal part of a split-binion is a 1-vector.
"""
function unreal(z::SplitBinion{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::SplitBinion)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", s: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{SplitBinion{T}}) where T <: Real
    SplitBinion{T}(rand(T), rand(T))
end

function random(::Type{SplitBinion{BigInt}})
    SplitBinion{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{SplitBinion{BigFloat}})
    SplitBinion{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{SplitBinion{Rational{BigInt}}})
    SplitBinion{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function convert(::Type{SplitBinion{T}}, a::Real) where T <: Real
    SplitBinion{T}(a, zero(T))
end

function convert(::Type{SplitBinion{T}}, z::SplitBinion) where T <: Real
    SplitBinion{T}(z.l, z.r)
end

function promote_rule(::Type{SplitBinion{T}}, ::Type{S}) where {T <: Real, S <: Real}
    SplitBinion{promote_type(T, S)}
end

function promote_rule(::Type{SplitBinion{T}}, ::Type{SplitBinion{S}}) where {T <: Real, S <: Real}
    SplitBinion{promote_type(T, S)}
end
