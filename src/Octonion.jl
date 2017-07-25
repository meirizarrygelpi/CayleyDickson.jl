"""
    Octonion{T <: Real} = Elliptic{Quaternion{T}}

An octonion is an elliptic Cayley-Dickson construct with quaternions.
"""
const Octonion{T <: Real} = Elliptic{Quaternion{T}}

function Octonion(z::Quaternion{T}) where T <: Real
    Octonion{T}(z, zero(Quaternion{T}))
end

function Octonion(z::Cplex{T}) where T <: Real
    Octonion{T}(
        Quaternion{T}(z, zero(Cplex{T})),
        zero(Quaternion{T})
    )
end

function Octonion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Octonion{T}(
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

function Octonion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Octonion{T}(
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

function Octonion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Octonion{T}(
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

function Octonion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Octonion{T}(
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

function Octonion(a::T, b::T, c::T, d::T) where T <: Real
    Octonion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Quaternion{T})
    )
end

function Octonion(a::T, b::T, c::T) where T <: Real
    Octonion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Quaternion{T})
    )
end

function Octonion(a::T, b::T) where T <: Real
    Octonion{T}(
        Quaternion{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Quaternion{T})
    )
end

function Octonion(a::T) where T <: Real
    Octonion{T}(
        Quaternion{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Quaternion{T})
    )
end

function Octonion(a::Real, b::Real)
    Octonion(promote(a, b)...)
end

function Octonion(a::Real, b::Real, c::Real)
    Octonion(promote(a, b, c)...)
end

function Octonion(a::Real, b::Real, c::Real, d::Real)
    Octonion(promote(a, b, c, d)...)
end

function Octonion(a::Real, b::Real, c::Real, d::Real, f::Real)
    Octonion(promote(a, b, c, d, f)...)
end

function Octonion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Octonion(promote(a, b, c, d, f, g)...)
end

function Octonion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Octonion(promote(a, b, c, d, f, g, h)...)
end

function Octonion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Octonion(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::Octonion)

The unreal part of an octonion is a 7-vector.
"""
function unreal(z::Octonion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Octonion)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", j: ")
    print(io, z.l.r.l)
    print(io, ", ij: ")
    print(io, z.l.r.r)
    print(io, ", k: ")
    print(io, z.r.l.l)
    print(io, ", ik: ")
    print(io, z.r.l.r)
    print(io, ", jk: ")
    print(io, z.r.r.l)
    print(io, ", (ij)k: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Octonion{T}}) where T <: Real
    Octonion{T}(random(Quaternion{T}), random(Quaternion{T}))
end
