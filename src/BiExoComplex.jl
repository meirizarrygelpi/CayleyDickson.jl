"""
    BiExoComplex{T <: Real} = Parabolic{ExoComplex{T}}

A bi-exo-complex number is a parabolic Cayley-Dickson construct with exo-complex numbers.
"""
const BiExoComplex{T <: Real} = Parabolic{ExoComplex{T}}

function BiExoComplex(z::ExoComplex{T}) where T <: Real
    BiExoComplex{T}(z, zero(ExoComplex{T}))
end

function BiExoComplex(z::Cplex{T}) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(z, zero(Cplex{T})),
        zero(ExoComplex{T})
    )
end

function BiExoComplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        ExoComplex{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, j)
        )
    )
end

function BiExoComplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        ExoComplex{T}(
            Cplex{T}(f, g),
            Cplex{T}(h, zero(T))
        )
    )
end

function BiExoComplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        ExoComplex{T}(
            Cplex{T}(f, g),
            zero(Cplex{T})
        )
    )
end

function BiExoComplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        ExoComplex{T}(
            Cplex{T}(f, zero(T)),
            zero(Cplex{T})
        )
    )
end

function BiExoComplex(a::T, b::T, c::T, d::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, d)
        ),
        zero(ExoComplex{T})
    )
end

function BiExoComplex(a::T, b::T, c::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            Cplex{T}(c, zero(T))
        ),
        zero(ExoComplex{T})
    )
end

function BiExoComplex(a::T, b::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, b),
            zero(Cplex{T})
        ),
        zero(ExoComplex{T})
    )
end

function BiExoComplex(a::T) where T <: Real
    BiExoComplex{T}(
        ExoComplex{T}(
            Cplex{T}(a, zero(T)),
            zero(Cplex{T})
        ),
        zero(ExoComplex{T})
    )
end

function BiExoComplex(a::Real, b::Real)
    BiExoComplex(promote(a, b)...)
end

function BiExoComplex(a::Real, b::Real, c::Real)
    BiExoComplex(promote(a, b, c)...)
end

function BiExoComplex(a::Real, b::Real, c::Real, d::Real)
    BiExoComplex(promote(a, b, c, d)...)
end

function BiExoComplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    BiExoComplex(promote(a, b, c, d, f)...)
end

function BiExoComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    BiExoComplex(promote(a, b, c, d, f, g)...)
end

function BiExoComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    BiExoComplex(promote(a, b, c, d, f, g, h)...)
end

function BiExoComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    BiExoComplex(promote(a, b, c, d, f, g, h, j)...)
end

function BiExoComplex(z::BiExoplex{T}) where T <: Real
    BiExoComplex(z.l.l, zero(T), z.l.r, zero(T), z.r.l, zero(T), z.r.r)
end

"""
    unreal(z::BiExoComplex)

The unreal part of a bi-exo-complex number is a 7-vector.
"""
function unreal(z::BiExoComplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::BiExoComplex)
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

function random(::Type{BiExoComplex{T}}) where T <: Real
    BiExoComplex{T}(random(ExoComplex{T}), random(ExoComplex{T}))
end
