"""
    ExoPerplex{T <: Real} = ParabolicCD{Perplex{T}}

An exo-perplex number is a parabolic Cayley-Dickson construct with perplex numbers.
"""
const ExoPerplex{T <: Real} = ParabolicCD{Perplex{T}}

function ExoPerplex(z::Perplex{T}) where T <: Real
    ExoPerplex{T}(z, zero(Perplex{T}))
end

function ExoPerplex(a::T, b::T, c::T, d::T) where T <: Real
    ExoPerplex{T}(Perplex{T}(a, b), Perplex{T}(c, d))
end

function ExoPerplex(a::T, b::T, c::T) where T <: Real
    ExoPerplex{T}(Perplex{T}(a, b), Perplex{T}(c, zero(T)))
end

function ExoPerplex(a::T, b::T) where T <: Real
    ExoPerplex{T}(Perplex{T}(a, b), zero(Perplex{T}))
end

function ExoPerplex(a::T) where T <: Real
    ExoPerplex{T}(Perplex{T}(a, zero(T)), zero(Perplex{T}))
end

function ExoPerplex(a::Real, b::Real)
    ExoPerplex(promote(a, b)...)
end

function ExoPerplex(a::Real, b::Real, c::Real)
    ExoPerplex(promote(a, b, c)...)
end

function ExoPerplex(a::Real, b::Real, c::Real, d::Real)
    ExoPerplex(promote(a, b, c, d)...)
end

"""
    unreal(z::ExoPerplex)

The unreal part of an exo-perplex number is a 3-vector.
"""
function unreal(z::ExoPerplex)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::ExoPerplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", s: ")
    print(io, z.l.r)
    print(io, ", A: ")
    print(io, z.r.l)
    print(io, ", sA: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{ExoPerplex{T}}) where T <: Real
    ExoPerplex{T}(random(Perplex{T}), random(Perplex{T}))
end
