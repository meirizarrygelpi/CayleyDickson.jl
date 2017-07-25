"""
    Exo1Quaternion{T <: Real} = Parabolic{Quaternion{T}}

An 1-exo-quaternion is a parabolic Cayley-Dickson construct with quaternions.
"""
const Exo1Quaternion{T <: Real} = Parabolic{Quaternion{T}}

function Exo1Quaternion(z::Quaternion{T}) where T <: Real
    Exo1Quaternion{T}(z, zero(Quaternion{T}))
end

function Exo1Quaternion(z::Cplex{T}) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(z, zero(Cplex{T})),
        zero(Quaternion{T})
    )
end

function Exo1Quaternion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Quaternion{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, j)
        )
    )
end

function Exo1Quaternion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Quaternion{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, zero(T))
        )
    )
end

function Exo1Quaternion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Quaternion{T}(
            Cplex{T}(f, g),
            zero(Cplex{T})
        )
    )
end

function Exo1Quaternion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Quaternion{T}(
            Cplex{T}(f, zero(T)),
            zero(Cplex{T})
        )
    )
end

function Exo1Quaternion(a::T, b::T, c::T, d::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Quaternion{T})
    )
end

function Exo1Quaternion(a::T, b::T, c::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Quaternion{T})
    )
end

function Exo1Quaternion(a::T, b::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Quaternion{T})
    )
end

function Exo1Quaternion(a::T) where T <: Real
    Exo1Quaternion{T}(
        Quaternion{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Quaternion{T})
    )
end

function Exo1Quaternion(a::Real, b::Real)
    Exo1Quaternion(promote(a, b)...)
end

function Exo1Quaternion(a::Real, b::Real, c::Real)
    Exo1Quaternion(promote(a, b, c)...)
end

function Exo1Quaternion(a::Real, b::Real, c::Real, d::Real)
    Exo1Quaternion(promote(a, b, c, d)...)
end

function Exo1Quaternion(a::Real, b::Real, c::Real, d::Real, f::Real)
    Exo1Quaternion(promote(a, b, c, d, f)...)
end

function Exo1Quaternion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Exo1Quaternion(promote(a, b, c, d, f, g)...)
end

function Exo1Quaternion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Exo1Quaternion(promote(a, b, c, d, f, g, h)...)
end

function Exo1Quaternion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Exo1Quaternion(promote(a, b, c, d, f, g, h, j)...)
end

function Exo1Quaternion(z::Exoplex{T}) where T <: Real
    Exo1Quaternion(z.l, zero(T), zero(T), zero(T), z.r, zero(T), zero(T), zero(T))
end

"""

    unreal(z::Exo1Quaternion)

The unreal part of an exo-quaternion is a 7-vector.
"""
function unreal(z::Exo1Quaternion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo1Quaternion)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", j: ")
    print(io, z.l.r.l)
    print(io, ", ij: ")
    print(io, z.l.r.r)
    print(io, ", a: ")
    print(io, z.r.l.l)
    print(io, ", ia: ")
    print(io, z.r.l.r)
    print(io, ", ja: ")
    print(io, z.r.r.l)
    print(io, ", (ij)a: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Exo1Quaternion{T}}) where T <: Real
    Exo1Quaternion{T}(random(Quaternion{T}), random(Quaternion{T}))
end
