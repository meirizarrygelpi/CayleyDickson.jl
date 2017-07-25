"""
    Exo1SplitQuaternion{T <: Real} = Parabolic{SplitQuaternion{T}}

A 1-exo-split-quaternion is a parabolic Cayley-Dickson construct with split-quaternions.
"""
const Exo1SplitQuaternion{T <: Real} = Parabolic{SplitQuaternion{T}}

function Exo1SplitQuaternion(z::SplitQuaternion{T}) where T <: Real
    Exo1SplitQuaternion{T}(z, zero(SplitQuaternion{T}))
end

function Exo1SplitQuaternion(z::Cplex{T}) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(z, zero(Cplex{T})),
        zero(SplitQuaternion{T})
    )
end

function Exo1SplitQuaternion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        SplitQuaternion{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, j)
        )
    )
end

function Exo1SplitQuaternion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        SplitQuaternion{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, zero(T))
        )
    )
end

function Exo1SplitQuaternion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        SplitQuaternion{T}(
            Cplex{T}(f, g),
            zero(Cplex{T})
        )
    )
end

function Exo1SplitQuaternion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        SplitQuaternion{T}(
            Cplex{T}(f, zero(T)),
            zero(Cplex{T})
        )
    )
end

function Exo1SplitQuaternion(a::T, b::T, c::T, d::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(SplitQuaternion{T})
    )
end

function Exo1SplitQuaternion(a::T, b::T, c::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(SplitQuaternion{T})
    )
end

function Exo1SplitQuaternion(a::T, b::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(SplitQuaternion{T})
    )
end

function Exo1SplitQuaternion(a::T) where T <: Real
    Exo1SplitQuaternion{T}(
        SplitQuaternion{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(SplitQuaternion{T})
    )
end

function Exo1SplitQuaternion(a::Real, b::Real)
    Exo1SplitQuaternion(promote(a, b)...)
end

function Exo1SplitQuaternion(a::Real, b::Real, c::Real)
    Exo1SplitQuaternion(promote(a, b, c)...)
end

function Exo1SplitQuaternion(a::Real, b::Real, c::Real, d::Real)
    Exo1SplitQuaternion(promote(a, b, c, d)...)
end

function Exo1SplitQuaternion(a::Real, b::Real, c::Real, d::Real, f::Real)
    Exo1SplitQuaternion(promote(a, b, c, d, f)...)
end

function Exo1SplitQuaternion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Exo1SplitQuaternion(promote(a, b, c, d, f, g)...)
end

function Exo1SplitQuaternion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Exo1SplitQuaternion(promote(a, b, c, d, f, g, h)...)
end

function Exo1SplitQuaternion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Exo1SplitQuaternion(promote(a, b, c, d, f, g, h, j)...)
end

function Exo1SplitQuaternion(z::Exo1Real{T}) where T <: Real
    Exo1SplitQuaternion(z.l, zero(T), zero(T), zero(T), z.r, zero(T), zero(T), zero(T))
end

"""
    unreal(z::Exo1SplitQuaternion)

The unreal part of a 1-exo-split-quaternion is a 7-vector.
"""
function unreal(z::Exo1SplitQuaternion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo1SplitQuaternion)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", s: ")
    print(io, z.l.r.l)
    print(io, ", is: ")
    print(io, z.l.r.r)
    print(io, ", a: ")
    print(io, z.r.l.l)
    print(io, ", ia: ")
    print(io, z.r.l.r)
    print(io, ", sa: ")
    print(io, z.r.r.l)
    print(io, ", (is)a: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Exo1SplitQuaternion{T}}) where T <: Real
    Exo1SplitQuaternion{T}(random(SplitQuaternion{T}), random(SplitQuaternion{T}))
end
