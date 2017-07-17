"""
    Cockle{T <: Real} = Hyperbolic{Cplex{T}}

A Cockle quaternion is a hyperbolic Cayley-Dickson construct with complex numbers.
"""
const Cockle{T <: Real} = Hyperbolic{Cplex{T}}

function Cockle(z::Cplex{T}) where T <: Real
    Cockle{T}(z, zero(Cplex{T}))
end

function Cockle(a::T, b::T, c::T, d::T) where T <: Real
    Cockle{T}(Cplex{T}(a, b), Cplex{T}(c, d))
end

function Cockle(a::T, b::T, c::T) where T <: Real
    Cockle{T}(Cplex{T}(a, b), Cplex{T}(c, zero(T)))
end

function Cockle(a::T, b::T) where T <: Real
    Cockle{T}(Cplex{T}(a, b), zero(Cplex{T}))
end

function Cockle(a::T) where T <: Real
    Cockle{T}(Cplex{T}(a, zero(T)), zero(Cplex{T}))
end

function Cockle(a::Real, b::Real)
    Cockle(promote(a, b)...)
end

function Cockle(a::Real, b::Real, c::Real)
    Cockle(promote(a, b, c)...)
end

function Cockle(a::Real, b::Real, c::Real, d::Real)
    Cockle(promote(a, b, c, d)...)
end

"""
    unreal(z::Cockle)

The unreal part of a Cockle quaternion is a 3-vector.
"""
function unreal(z::Cockle)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Cockle)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", i: ")
    print(io, z.l.r)
    print(io, ", s: ")
    print(io, z.r.l)
    print(io, ", is: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{Cockle{T}}) where T <: Real
    Cockle{T}(random(Cplex{T}), random(Cplex{T}))
end
