"""
    ExoComplex{T <: Real} = ParabolicCD{Cplex{T}}

An exo-complex number is a parabolic Cayley-Dickson construct with complex numbers.
"""
const ExoComplex{T <: Real} = ParabolicCD{Cplex{T}}

function ExoComplex(z::Cplex{T}) where T <: Real
    ExoComplex{T}(z, zero(Cplex{T}))
end

function ExoComplex(a::T, b::T, c::T, d::T) where T <: Real
    ExoComplex{T}(Cplex{T}(a, b), Cplex{T}(c, d))
end

function ExoComplex(a::T, b::T, c::T) where T <: Real
    ExoComplex{T}(Cplex{T}(a, b), Cplex{T}(c, zero(T)))
end

function ExoComplex(a::T, b::T) where T <: Real
    ExoComplex{T}(Cplex{T}(a, b), zero(Cplex{T}))
end

function ExoComplex(a::T) where T <: Real
    ExoComplex{T}(Cplex{T}(a, zero(T)), zero(Cplex{T}))
end

function ExoComplex(a::Real, b::Real)
    ExoComplex(promote(a, b)...)
end

function ExoComplex(a::Real, b::Real, c::Real)
    ExoComplex(promote(a, b, c)...)
end

function ExoComplex(a::Real, b::Real, c::Real, d::Real)
    ExoComplex(promote(a, b, c, d)...)
end

function ExoComplex(z::Exoplex{T}) where T <: Real
    ExoComplex(z.l, zero(T), z.r, zero(T))
end

"""
    unreal(z::ExoComplex)

The unreal part of an exo-complex number is a 3-vector.
"""
function unreal(z::ExoComplex)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::ExoComplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", i: ")
    print(io, z.l.r)
    print(io, ", A: ")
    print(io, z.r.l)
    print(io, ", iA: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{ExoComplex{T}}) where T <: Real
    ExoComplex{T}(random(Cplex{T}), random(Cplex{T}))
end
