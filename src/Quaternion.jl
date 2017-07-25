"""
    Quaternion{T <: Real} = Elliptic{Cplex{T}}

A quaternion is an elliptic Cayley-Dickson construct with complex numbers.
"""
const Quaternion{T <: Real} = Elliptic{Cplex{T}}

function Quaternion(z::Cplex{T}) where T <: Real
    Quaternion{T}(z, zero(Cplex{T}))
end

function Quaternion(a::T, b::T, c::T, d::T) where T <: Real
    Quaternion{T}(Cplex{T}(a, b), Cplex{T}(c, d))
end

function Quaternion(a::T, b::T, c::T) where T <: Real
    Quaternion{T}(Cplex{T}(a, b), Cplex{T}(c, zero(T)))
end

function Quaternion(a::T, b::T) where T <: Real
    Quaternion{T}(Cplex{T}(a, b), zero(Cplex{T}))
end

function Quaternion(a::T) where T <: Real
    Quaternion{T}(Cplex{T}(a, zero(T)), zero(Cplex{T}))
end

function Quaternion(a::Real, b::Real)
    Quaternion(promote(a, b)...)
end

function Quaternion(a::Real, b::Real, c::Real)
    Quaternion(promote(a, b, c)...)
end

function Quaternion(a::Real, b::Real, c::Real, d::Real)
    Quaternion(promote(a, b, c, d)...)
end

"""
    unreal(z::Quaternion)

The unreal part of a quaternion is a 3-vector.
"""
function unreal(z::Quaternion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Quaternion)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", i: ")
    print(io, z.l.r)
    print(io, ", j: ")
    print(io, z.r.l)
    print(io, ", ij: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{Quaternion{T}}) where T <: Real
    Quaternion{T}(random(Cplex{T}), random(Cplex{T}))
end
