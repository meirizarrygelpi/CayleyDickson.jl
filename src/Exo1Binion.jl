"""
    Exo1Binion{T <: Real} = Parabolic{Cplex{T}}

A 1-exo-binion is a parabolic Cayley-Dickson construct with binions.
"""
const Exo1Binion{T <: Real} = Parabolic{Cplex{T}}

function Exo1Binion(z::Cplex{T}) where T <: Real
    Exo1Binion{T}(z, zero(Cplex{T}))
end

function Exo1Binion(a::T, b::T, c::T, d::T) where T <: Real
    Exo1Binion{T}(Cplex{T}(a, b), Cplex{T}(c, d))
end

function Exo1Binion(a::T, b::T, c::T) where T <: Real
    Exo1Binion{T}(Cplex{T}(a, b), Cplex{T}(c, zero(T)))
end

function Exo1Binion(a::T, b::T) where T <: Real
    Exo1Binion{T}(Cplex{T}(a, b), zero(Cplex{T}))
end

function Exo1Binion(a::T) where T <: Real
    Exo1Binion{T}(Cplex{T}(a, zero(T)), zero(Cplex{T}))
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

function Exo1Binion(z::Exoplex{T}) where T <: Real
    Exo1Binion(z.l, zero(T), z.r, zero(T))
end

function cloak(z::Exo1Binion{T}) where T <: Real
    Exo1Binion{T}(-(z.l), z.r)
end

function dagger(z::Exo1Binion{T}) where T <: Real
    Exo1Binion{T}(z.l, -(z.r))
end

function star(z::Exo1Binion{T}) where T <: Real
    Exo1Binion{T}(z.r, z.l)
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
    Exo1Binion{T}(random(Cplex{T}), random(Cplex{T}))
end
