"""
    Exo2Binion{T <: Real} = Parabolic{Exo1Binion{T}}

A 2-exo-binion is a parabolic Cayley-Dickson construct with 1-exo-binions.
"""
const Exo2Binion{T <: Real} = Parabolic{Exo1Binion{T}}

function Exo2Binion(z::Exo1Binion{T}) where T <: Real
    Exo2Binion{T}(z, zero(Exo1Binion{T}))
end

function Exo2Binion(z::Binion{T}) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(z, zero(Binion{T})),
        zero(Exo1Binion{T})
    )
end

function Exo2Binion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            Binion{T}(c, d)
        ),
        Exo1Binion{T}(
            Binion{T}(f, g),
            Binion{T}(h, j)
        )
    )
end

function Exo2Binion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            Binion{T}(c, d)
        ),
        Exo1Binion{T}(
            Binion{T}(f, g),
            Binion{T}(h, zero(T))
        )
    )
end

function Exo2Binion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            Binion{T}(c, d)
        ),
        Exo1Binion{T}(
            Binion{T}(f, g),
            zero(Binion{T})
        )
    )
end

function Exo2Binion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            Binion{T}(c, d)
        ),
        Exo1Binion{T}(
            Binion{T}(f, zero(T)),
            zero(Binion{T})
        )
    )
end

function Exo2Binion(a::T, b::T, c::T, d::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            Binion{T}(c, d)
        ),
        zero(Exo1Binion{T})
    )
end

function Exo2Binion(a::T, b::T, c::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            Binion{T}(c, zero(T))
        ),
        zero(Exo1Binion{T})
    )
end

function Exo2Binion(a::T, b::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, b),
            zero(Binion{T})
        ),
        zero(Exo1Binion{T})
    )
end

function Exo2Binion(a::T) where T <: Real
    Exo2Binion{T}(
        Exo1Binion{T}(
            Binion{T}(a, zero(T)),
            zero(Binion{T})
        ),
        zero(Exo1Binion{T})
    )
end

function Exo2Binion(a::Real, b::Real)
    Exo2Binion(promote(a, b)...)
end

function Exo2Binion(a::Real, b::Real, c::Real)
    Exo2Binion(promote(a, b, c)...)
end

function Exo2Binion(a::Real, b::Real, c::Real, d::Real)
    Exo2Binion(promote(a, b, c, d)...)
end

function Exo2Binion(a::Real, b::Real, c::Real, d::Real, f::Real)
    Exo2Binion(promote(a, b, c, d, f)...)
end

function Exo2Binion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Exo2Binion(promote(a, b, c, d, f, g)...)
end

function Exo2Binion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Exo2Binion(promote(a, b, c, d, f, g, h)...)
end

function Exo2Binion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Exo2Binion(promote(a, b, c, d, f, g, h, j)...)
end

function Exo2Binion(z::Exo2Real{T}) where T <: Real
    Exo2Binion(z.l.l, zero(T), z.l.r, zero(T), z.r.l, zero(T), z.r.r)
end

"""
    unreal(z::Exo2Binion)

The unreal part of a 2-exo-binion is a 7-vector.
"""
function unreal(z::Exo2Binion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo2Binion)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", a: ")
    print(io, z.l.r.l)
    print(io, ", ia: ")
    print(io, z.l.r.r)
    print(io, ", b: ")
    print(io, z.r.l.l)
    print(io, ", ib: ")
    print(io, z.r.l.r)
    print(io, ", ab: ")
    print(io, z.r.r.l)
    print(io, ", (ia)b: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Exo2Binion{T}}) where T <: Real
    Exo2Binion{T}(random(Exo1Binion{T}), random(Exo1Binion{T}))
end
