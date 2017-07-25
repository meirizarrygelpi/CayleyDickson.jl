"""
    ExoHamilton{T <: Real} = Parabolic{Quaternion{T}}

An exo-Quaternion quaterion is a parabolic Cayley-Dickson construct with Quaternion quaternions.
"""
const ExoHamilton{T <: Real} = Parabolic{Quaternion{T}}

function ExoHamilton(z::Quaternion{T}) where T <: Real
    ExoHamilton{T}(z, zero(Quaternion{T}))
end

function ExoHamilton(z::Cplex{T}) where T <: Real
    ExoHamilton{T}(
        Quaternion{T}(z, zero(Cplex{T})),
        zero(Quaternion{T})
    )
end

function ExoHamilton(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    ExoHamilton{T}(
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

function ExoHamilton(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    ExoHamilton{T}(
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

function ExoHamilton(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    ExoHamilton{T}(
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

function ExoHamilton(a::T, b::T, c::T, d::T, f::T) where T <: Real
    ExoHamilton{T}(
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

function ExoHamilton(a::T, b::T, c::T, d::T) where T <: Real
    ExoHamilton{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Quaternion{T})
    )
end

function ExoHamilton(a::T, b::T, c::T) where T <: Real
    ExoHamilton{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Quaternion{T})
    )
end

function ExoHamilton(a::T, b::T) where T <: Real
    ExoHamilton{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Quaternion{T})
    )
end

function ExoHamilton(a::T) where T <: Real
    ExoHamilton{T}(
        Quaternion{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Quaternion{T})
    )
end

function ExoHamilton(a::Real, b::Real)
    ExoHamilton(promote(a, b)...)
end

function ExoHamilton(a::Real, b::Real, c::Real)
    ExoHamilton(promote(a, b, c)...)
end

function ExoHamilton(a::Real, b::Real, c::Real, d::Real)
    ExoHamilton(promote(a, b, c, d)...)
end

function ExoHamilton(a::Real, b::Real, c::Real, d::Real, f::Real)
    ExoHamilton(promote(a, b, c, d, f)...)
end

function ExoHamilton(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    ExoHamilton(promote(a, b, c, d, f, g)...)
end

function ExoHamilton(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    ExoHamilton(promote(a, b, c, d, f, g, h)...)
end

function ExoHamilton(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    ExoHamilton(promote(a, b, c, d, f, g, h, j)...)
end

function ExoHamilton(z::Exoplex{T}) where T <: Real
    ExoHamilton(z.l, zero(T), zero(T), zero(T), z.r, zero(T), zero(T), zero(T))
end

"""

    unreal(z::ExoHamilton)

The unreal part of an exo-quaternion is a 7-vector.
"""
function unreal(z::ExoHamilton)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::ExoHamilton)
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

function random(::Type{ExoHamilton{T}}) where T <: Real
    ExoHamilton{T}(random(Quaternion{T}), random(Quaternion{T}))
end
