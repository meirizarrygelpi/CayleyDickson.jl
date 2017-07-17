"""
    Cayley{T <: Real} = Elliptic{Hamilton{T}}

A Cayley octonion is an elliptic Cayley-Dickson construct with Hamilton quaternions.
"""
const Cayley{T <: Real} = Elliptic{Hamilton{T}}

function Cayley(z::Hamilton{T}) where T <: Real
    Cayley{T}(z, zero(Hamilton{T}))
end

function Cayley(z::Cplex{T}) where T <: Real
    Cayley{T}(
        Hamilton{T}(z, zero(Cplex{T})),
        zero(Hamilton{T})
    )
end

function Cayley(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, j)
        )
    )
end

function Cayley(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, zero(T))
        )
    )
end

function Cayley(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, g),
            zero(Cplex{T})
        )
    )
end

function Cayley(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Hamilton{T}(
            Cplex{T}(f, zero(T)),
            zero(Cplex{T})
        )
    )
end

function Cayley(a::T, b::T, c::T, d::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Hamilton{T})
    )
end

function Cayley(a::T, b::T, c::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Hamilton{T})
    )
end

function Cayley(a::T, b::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Hamilton{T})
    )
end

function Cayley(a::T) where T <: Real
    Cayley{T}(
        Hamilton{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Hamilton{T})
    )
end

function Cayley(a::Real, b::Real)
    Cayley(promote(a, b)...)
end

function Cayley(a::Real, b::Real, c::Real)
    Cayley(promote(a, b, c)...)
end

function Cayley(a::Real, b::Real, c::Real, d::Real)
    Cayley(promote(a, b, c, d)...)
end

function Cayley(a::Real, b::Real, c::Real, d::Real, f::Real)
    Cayley(promote(a, b, c, d, f)...)
end

function Cayley(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Cayley(promote(a, b, c, d, f, g)...)
end

function Cayley(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Cayley(promote(a, b, c, d, f, g, h)...)
end

function Cayley(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Cayley(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::Cayley)

The unreal part of a Cayley octonion is a 7-vector.
"""
function unreal(z::Cayley)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Cayley)
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

function random(::Type{Cayley{T}}) where T <: Real
    Cayley{T}(random(Hamilton{T}), random(Hamilton{T}))
end
