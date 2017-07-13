"""
    ExoCockle{T <: Real} = ParabolicCD{Cockle{T}}

An exo-Cockle quaterion is a parabolic Cayley-Dickson construct with Cockle quaternions.
"""
const ExoCockle{T <: Real} = ParabolicCD{Cockle{T}}

function ExoCockle(z::Cockle{T}) where T <: Real
    ExoCockle{T}(z, zero(Cockle{T}))
end

function ExoCockle(z::Cplex{T}) where T <: Real
    ExoCockle{T}(
        Cockle{T}(z, zero(Cplex{T})),
        zero(Cockle{T})
    )
end

function ExoCockle(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Cockle{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, j)
        )
    )
end

function ExoCockle(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Cockle{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, zero(T))
        )
    )
end

function ExoCockle(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Cockle{T}(
            Cplex{T}(f, g),
            zero(Cplex{T})
        )
    )
end

function ExoCockle(a::T, b::T, c::T, d::T, f::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        Cockle{T}(
            Cplex{T}(f, zero(T)),
            zero(Cplex{T})
        )
    )
end

function ExoCockle(a::T, b::T, c::T, d::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(Cockle{T})
    )
end

function ExoCockle(a::T, b::T, c::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(Cockle{T})
    )
end

function ExoCockle(a::T, b::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(Cockle{T})
    )
end

function ExoCockle(a::T) where T <: Real
    ExoCockle{T}(
        Cockle{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(Cockle{T})
    )
end

function ExoCockle(a::Real, b::Real)
    ExoCockle(promote(a, b)...)
end

function ExoCockle(a::Real, b::Real, c::Real)
    ExoCockle(promote(a, b, c)...)
end

function ExoCockle(a::Real, b::Real, c::Real, d::Real)
    ExoCockle(promote(a, b, c, d)...)
end

function ExoCockle(a::Real, b::Real, c::Real, d::Real, f::Real)
    ExoCockle(promote(a, b, c, d, f)...)
end

function ExoCockle(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    ExoCockle(promote(a, b, c, d, f, g)...)
end

function ExoCockle(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    ExoCockle(promote(a, b, c, d, f, g, h)...)
end

function ExoCockle(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    ExoCockle(promote(a, b, c, d, f, g, h, j)...)
end

function ExoCockle(z::Exoplex{T}) where T <: Real
    ExoCockle(z.l, zero(T), zero(T), zero(T), z.r, zero(T), zero(T), zero(T))
end

"""
    unreal(z::ExoCockle)

The unreal part of an exo-Cockle quaterion is a 7-vector.
"""
function unreal(z::ExoCockle)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::ExoCockle)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", s: ")
    print(io, z.l.r.l)
    print(io, ", is: ")
    print(io, z.l.r.r)
    print(io, ", A: ")
    print(io, z.r.l.l)
    print(io, ", iA: ")
    print(io, z.r.l.r)
    print(io, ", sA: ")
    print(io, z.r.r.l)
    print(io, ", (is)A: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{ExoCockle{T}}) where T <: Real
    ExoCockle{T}(random(Cockle{T}), random(Cockle{T}))
end
