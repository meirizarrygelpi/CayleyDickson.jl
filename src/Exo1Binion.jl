"""
    Exo1Binion{T <: Real} = Parabolic{Binion{T}}

A 1-exo-binion is a parabolic Cayley-Dickson construct with binions.
"""
const Exo1Binion{T <: Real} = Parabolic{Binion{T}}

function Exo1Binion(z::Binion{T}) where T <: Real
    Exo1Binion{T}(z, zero(Binion{T}))
end

function Exo1Binion(a::T, b::T, c::T, d::T) where T <: Real
    Exo1Binion{T}(Binion{T}(a, b), Binion{T}(c, d))
end

function Exo1Binion(a::T, b::T, c::T) where T <: Real
    Exo1Binion{T}(Binion{T}(a, b), Binion{T}(c, zero(T)))
end

function Exo1Binion(a::T, b::T) where T <: Real
    Exo1Binion{T}(Binion{T}(a, b), zero(Binion{T}))
end

function Exo1Binion(a::T) where T <: Real
    Exo1Binion{T}(Binion{T}(a, zero(T)), zero(Binion{T}))
end

function Exo1Binion(a::Real, b::Real)
    Exo1Binion(promote(a, b)...)
end

function Exo1Binion(a::Real, b::Real, c::Real)
    Exo1Binion(promote(a, b, c)...)
end

function Exo1Binion(a::Real, b::Real, c::Real, d::Real)
    Exo1Binion(promote(a, b, c, d)...)
end

function Exo1Binion(z::Exo1Real{T}) where T <: Real
    Exo1Binion(z.l, zero(T), z.r, zero(T))
end

function selfstar(z::Exo1Binion)
    (z + star(z)) / 2
end

function anti_selfstar(z::Exo1Binion)
    (z - star(z)) / 2
end

"""
    unreal(z::Exo1Binion)

The unreal part of a 1-exo-binion is a 3-vector.
"""
function unreal(z::Exo1Binion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo1Binion)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", i: ")
    print(io, z.l.r)
    print(io, ", a: ")
    print(io, z.r.l)
    print(io, ", ia: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{Exo1Binion{T}}) where T <: Real
    Exo1Binion{T}(random(Binion{T}), random(Binion{T}))
end
