"""
    Zorn{T <: Real} = HyperbolicCD{Hamilton{T}}

A Zorn octonion is a hyperbolic Cayley-Dickson construct with Hamilton quaternions.
"""
const Zorn{T <: Real} = HyperbolicCD{Hamilton{T}}

function Zorn(z::Hamilton{T}) where T <: Real
    Zorn{T}(z, zero(Hamilton{T}))
end

function Zorn(z::Cplex{T}) where T <: Real
    Zorn{T}(
        Hamilton{T}(z, zero(Cplex{T})),
        zero(Hamilton{T})
    )
end

function Zorn(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Zorn{T}(
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

function Zorn(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Zorn{T}(
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

function Zorn(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Zorn{T}(
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

function Zorn(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Zorn{T}(
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

function Zorn(a::T, b::T, c::T, d::T) where T <: Real
    Zorn{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Hamilton{T})
    )
end

function Zorn(a::T, b::T, c::T) where T <: Real
    Zorn{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Hamilton{T})
    )
end

function Zorn(a::T, b::T) where T <: Real
    Zorn{T}(
        Hamilton{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Hamilton{T})
    )
end

function Zorn(a::T) where T <: Real
    Zorn{T}(
        Hamilton{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Hamilton{T})
    )
end

function Zorn(a::Real, b::Real)
    Zorn(promote(a, b)...)
end

function Zorn(a::Real, b::Real, c::Real)
    Zorn(promote(a, b, c)...)
end

function Zorn(a::Real, b::Real, c::Real, d::Real)
    Zorn(promote(a, b, c, d)...)
end

function Zorn(a::Real, b::Real, c::Real, d::Real, f::Real)
    Zorn(promote(a, b, c, d, f)...)
end

function Zorn(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Zorn(promote(a, b, c, d, f, g)...)
end

function Zorn(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Zorn(promote(a, b, c, d, f, g, h)...)
end

function Zorn(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Zorn(promote(a, b, c, d, f, g, h, j)...)
end


"""
    unreal(z::Zorn)

The unreal part of a Zorn octonion is a 7-vector.
"""
function unreal(z::Zorn)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Zorn)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", j: ")
    print(io, z.l.r.l)
    print(io, ", ij: ")
    print(io, z.l.r.r)
    print(io, ", s: ")
    print(io, z.r.l.l)
    print(io, ", is: ")
    print(io, z.r.l.r)
    print(io, ", js: ")
    print(io, z.r.r.l)
    print(io, ", (ij)s: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Zorn{T}}) where T <: Real
    Zorn{T}(random(Hamilton{T}), random(Hamilton{T}))
end
