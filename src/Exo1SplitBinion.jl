"""
    Exo1SplitBinion{T <: Real} = Parabolic{SplitBinion{T}}

An exo-perplex number is a parabolic Cayley-Dickson construct with perplex numbers.
"""
const Exo1SplitBinion{T <: Real} = Parabolic{SplitBinion{T}}

function Exo1SplitBinion(z::SplitBinion{T}) where T <: Real
    Exo1SplitBinion{T}(z, zero(SplitBinion{T}))
end

function Exo1SplitBinion(a::T, b::T, c::T, d::T) where T <: Real
    Exo1SplitBinion{T}(SplitBinion{T}(a, b), SplitBinion{T}(c, d))
end

function Exo1SplitBinion(a::T, b::T, c::T) where T <: Real
    Exo1SplitBinion{T}(SplitBinion{T}(a, b), SplitBinion{T}(c, zero(T)))
end

function Exo1SplitBinion(a::T, b::T) where T <: Real
    Exo1SplitBinion{T}(SplitBinion{T}(a, b), zero(SplitBinion{T}))
end

function Exo1SplitBinion(a::T) where T <: Real
    Exo1SplitBinion{T}(SplitBinion{T}(a, zero(T)), zero(SplitBinion{T}))
end

function Exo1SplitBinion(a::Real, b::Real)
    Exo1SplitBinion(promote(a, b)...)
end

function Exo1SplitBinion(a::Real, b::Real, c::Real)
    Exo1SplitBinion(promote(a, b, c)...)
end

function Exo1SplitBinion(a::Real, b::Real, c::Real, d::Real)
    Exo1SplitBinion(promote(a, b, c, d)...)
end

function Exo1SplitBinion(z::Exo1Real{T}) where T <: Real
    Exo1SplitBinion(z.l, zero(T), z.r, zero(T))
end

"""
    unreal(z::Exo1SplitBinion)

The unreal part of an exo-perplex number is a 3-vector.
"""
function unreal(z::Exo1SplitBinion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo1SplitBinion)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", s: ")
    print(io, z.l.r)
    print(io, ", a: ")
    print(io, z.r.l)
    print(io, ", sa: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{Exo1SplitBinion{T}}) where T <: Real
    Exo1SplitBinion{T}(random(SplitBinion{T}), random(SplitBinion{T}))
end
