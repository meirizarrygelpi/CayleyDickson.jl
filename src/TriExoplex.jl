"""
    TriExoplex{T <: Real} = Parabolic{BiExoplex{T}}

A tri-exoplex number is a parabolic Cayley-Dickson construct with bi-exoplex numbers.
"""
const TriExoplex{T <: Real} = Parabolic{BiExoplex{T}}

function TriExoplex(z::BiExoplex{T}) where T <: Real
    TriExoplex{T}(z, zero(BiExoplex{T}))
end

function TriExoplex(z::Exoplex{T}) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(z, zero(Exoplex{T})),
        zero(BiExoplex{T})
    )
end

function TriExoplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, g),
            Exoplex{T}(h, j)
        )
    )
end

function TriExoplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, g),
            Exoplex{T}(h, zero(T))
        )
    )
end

function TriExoplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, g),
            zero(Exoplex{T})
        )
    )
end

function TriExoplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        BiExoplex{T}(
            Exoplex{T}(f, zero(T)),
            zero(Exoplex{T})
        )
    )
end

function TriExoplex(a::T, b::T, c::T, d::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, d)
        ),
        zero(BiExoplex{T})
    )
end

function TriExoplex(a::T, b::T, c::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            Exoplex{T}(c, zero(T))
        ),
        zero(BiExoplex{T})
    )
end

function TriExoplex(a::T, b::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, b),
            zero(Exoplex{T})
        ),
        zero(BiExoplex{T})
    )
end

function TriExoplex(a::T) where T <: Real
    TriExoplex{T}(
        BiExoplex{T}(
            Exoplex{T}(a, zero(T)),
            zero(Exoplex{T})
        ),
        zero(BiExoplex{T})
    )
end

function TriExoplex(a::Real, b::Real)
    TriExoplex(promote(a, b)...)
end

function TriExoplex(a::Real, b::Real, c::Real)
    TriExoplex(promote(a, b, c)...)
end

function TriExoplex(a::Real, b::Real, c::Real, d::Real)
    TriExoplex(promote(a, b, c, d)...)
end

function TriExoplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    TriExoplex(promote(a, b, c, d, f)...)
end

function TriExoplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    TriExoplex(promote(a, b, c, d, f, g)...)
end

function TriExoplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    TriExoplex(promote(a, b, c, d, f, g, h)...)
end

function TriExoplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    TriExoplex(promote(a, b, c, d, f, g, h, j)...)
end

function cloak(z::TriExoplex{T}) where T <: Real
    TriExoplex{T}(cloak(z.l), dagger(z.r))
end

function dagger(z::TriExoplex{T}) where T <: Real
    TriExoplex{T}(dagger(z.l), cloak(z.r))
end

function star(z::TriExoplex{T}) where T <: Real
    TriExoplex{T}(dagger(star(z.r)), star(z.l))
end

function selfstar(z::TriExoplex)
    (z + star(z)) / 2
end

function antiselfstar(z::TriExoplex)
    (z - star(z)) / 2
end

"""
    unreal(z::TriExoplex)

The unreal part of a tri-exoplex number is a 7-vector.
"""
function unreal(z::TriExoplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::TriExoplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", A: ")
    print(io, z.l.l.r)
    print(io, ", B: ")
    print(io, z.l.r.l)
    print(io, ", AB: ")
    print(io, z.l.r.r)
    print(io, ", C: ")
    print(io, z.r.l.l)
    print(io, ", AC: ")
    print(io, z.r.l.r)
    print(io, ", BC: ")
    print(io, z.r.r.l)
    print(io, ", (AB)C: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{TriExoplex{T}}) where T <: Real
    TriExoplex{T}(random(BiExoplex{T}), random(BiExoplex{T}))
end
