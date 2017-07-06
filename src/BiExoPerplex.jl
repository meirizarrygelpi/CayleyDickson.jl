"""
    BiExoPerplex{T <: Real} = ParabolicCD{ExoPerplex{T}}

A bi-exo-perplex number is a parabolic Cayley-Dickson construct with exo-perplex numbers.
"""
const BiExoPerplex{T <: Real} = ParabolicCD{ExoPerplex{T}}

function BiExoPerplex(z::ExoPerplex{T}) where T <: Real
    BiExoPerplex{T}(z, zero(ExoPerplex{T}))
end

function BiExoPerplex(z::Perplex{T}) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(z, zero(Perplex{T})),
        zero(ExoPerplex{T})
    )
end

function BiExoPerplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, d)
        ),
        ExoPerplex{T}(
            Perplex{T}(f, g),
            Perplex{T}(h, j)
        )
    )
end

function BiExoPerplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, d)
        ),
        ExoPerplex{T}(
            Perplex{T}(f, g),
            Perplex{T}(h, zero(T))
        )
    )
end

function BiExoPerplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, d)
        ),
        ExoPerplex{T}(
            Perplex{T}(f, g),
            zero(Perplex{T})
        )
    )
end

function BiExoPerplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, d)
        ),
        ExoPerplex{T}(
            Perplex{T}(f, zero(T)),
            zero(Perplex{T})
        )
    )
end

function BiExoPerplex(a::T, b::T, c::T, d::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, d)
        ),
        zero(ExoPerplex{T})
    )
end

function BiExoPerplex(a::T, b::T, c::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, zero(T))
        ),
        zero(ExoPerplex{T})
    )
end

function BiExoPerplex(a::T, b::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            zero(Perplex{T})
        ),
        zero(ExoPerplex{T})
    )
end

function BiExoPerplex(a::T) where T <: Real
    BiExoPerplex{T}(
        ExoPerplex{T}(
            Perplex{T}(a, zero(T)),
            zero(Perplex{T})
        ),
        zero(ExoPerplex{T})
    )
end

function BiExoPerplex(a::Real, b::Real)
    BiExoPerplex(promote(a, b)...)
end

function BiExoPerplex(a::Real, b::Real, c::Real)
    BiExoPerplex(promote(a, b, c)...)
end

function BiExoPerplex(a::Real, b::Real, c::Real, d::Real)
    BiExoPerplex(promote(a, b, c, d)...)
end

function BiExoPerplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    BiExoPerplex(promote(a, b, c, d, f)...)
end

function BiExoPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    BiExoPerplex(promote(a, b, c, d, f, g)...)
end

function BiExoPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    BiExoPerplex(promote(a, b, c, d, f, g, h)...)
end

function BiExoPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    BiExoPerplex(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::BiExoPerplex)

The unreal part of a bi-exo-perplex number is a 7-vector.
"""
function unreal(z::BiExoPerplex)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::BiExoPerplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", s: ")
    print(io, z.l.l.r)
    print(io, ", A: ")
    print(io, z.l.r.l)
    print(io, ", sA: ")
    print(io, z.l.r.r)
    print(io, ", B: ")
    print(io, z.r.l.l)
    print(io, ", sB: ")
    print(io, z.r.l.r)
    print(io, ", AB: ")
    print(io, z.r.r.l)
    print(io, ", (sA)B: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{BiExoPerplex{T}}) where T <: Real
    BiExoPerplex{T}(random(ExoPerplex{T}), random(ExoPerplex{T}))
end
