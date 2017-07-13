"""
    Hamilton{T <: Real} = EllipticCD{Cplex{T}}

A Hamilton quaternion is an elliptic Cayley-Dickson construct with complex numbers.
"""
const Hamilton{T <: Real} = EllipticCD{Cplex{T}}

function Hamilton(z::Cplex{T}) where T <: Real
    Hamilton{T}(z, zero(Cplex{T}))
end

function Hamilton(a::T, b::T, c::T, d::T) where T <: Real
    Hamilton{T}(Cplex{T}(a, b), Cplex{T}(c, d))
end

function Hamilton(a::T, b::T, c::T) where T <: Real
    Hamilton{T}(Cplex{T}(a, b), Cplex{T}(c, zero(T)))
end

function Hamilton(a::T, b::T) where T <: Real
    Hamilton{T}(Cplex{T}(a, b), zero(Cplex{T}))
end

function Hamilton(a::T) where T <: Real
    Hamilton{T}(Cplex{T}(a, zero(T)), zero(Cplex{T}))
end

function Hamilton(a::Real, b::Real)
    Hamilton(promote(a, b)...)
end

function Hamilton(a::Real, b::Real, c::Real)
    Hamilton(promote(a, b, c)...)
end

function Hamilton(a::Real, b::Real, c::Real, d::Real)
    Hamilton(promote(a, b, c, d)...)
end

"""
    unreal(z::Hamilton)

The unreal part of a Hamilton quaternion is a 3-vector.
"""
function unreal(z::Hamilton)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::Hamilton)
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

function random(::Type{Hamilton{T}}) where T <: Real
    Hamilton{T}(random(Cplex{T}), random(Cplex{T}))
end
