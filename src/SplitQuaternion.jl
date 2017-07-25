"""
    SplitQuaternion{T <: Real} = Hyperbolic{Cplex{T}}

A split-quaternion is a hyperbolic Cayley-Dickson construct with complex numbers.
"""
const SplitQuaternion{T <: Real} = Hyperbolic{Cplex{T}}

function SplitQuaternion(z::Cplex{T}) where T <: Real
    SplitQuaternion{T}(z, zero(Cplex{T}))
end

function SplitQuaternion(a::T, b::T, c::T, d::T) where T <: Real
    SplitQuaternion{T}(Cplex{T}(a, b), Cplex{T}(c, d))
end

function SplitQuaternion(a::T, b::T, c::T) where T <: Real
    SplitQuaternion{T}(Cplex{T}(a, b), Cplex{T}(c, zero(T)))
end

function SplitQuaternion(a::T, b::T) where T <: Real
    SplitQuaternion{T}(Cplex{T}(a, b), zero(Cplex{T}))
end

function SplitQuaternion(a::T) where T <: Real
    SplitQuaternion{T}(Cplex{T}(a, zero(T)), zero(Cplex{T}))
end

function SplitQuaternion(a::Real, b::Real)
    SplitQuaternion(promote(a, b)...)
end

function SplitQuaternion(a::Real, b::Real, c::Real)
    SplitQuaternion(promote(a, b, c)...)
end

function SplitQuaternion(a::Real, b::Real, c::Real, d::Real)
    SplitQuaternion(promote(a, b, c, d)...)
end

"""
    unreal(z::SplitQuaternion)

The unreal part of a split-quaternion is a 3-vector.
"""
function unreal(z::SplitQuaternion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::SplitQuaternion)
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

function random(::Type{SplitQuaternion{T}}) where T <: Real
    SplitQuaternion{T}(random(Cplex{T}), random(Cplex{T}))
end
