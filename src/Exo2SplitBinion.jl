"""
    Exo2SplitBinion{T <: Real} = Parabolic{ExoPerplex{T}}

A 2-exo-split-binion is a parabolic Cayley-Dickson construct with 1-exo-split-binions.
"""
const Exo2SplitBinion{T <: Real} = Parabolic{ExoPerplex{T}}

function Exo2SplitBinion(z::ExoPerplex{T}) where T <: Real
    Exo2SplitBinion{T}(z, zero(ExoPerplex{T}))
end

function Exo2SplitBinion(z::Perplex{T}) where T <: Real
    Exo2SplitBinion{T}(
        ExoPerplex{T}(z, zero(Perplex{T})),
        zero(ExoPerplex{T})
    )
end

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Exo2SplitBinion{T}(
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

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Exo2SplitBinion{T}(
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

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Exo2SplitBinion{T}(
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

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Exo2SplitBinion{T}(
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

function Exo2SplitBinion(a::T, b::T, c::T, d::T) where T <: Real
    Exo2SplitBinion{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, d)
        ),
        zero(ExoPerplex{T})
    )
end

function Exo2SplitBinion(a::T, b::T, c::T) where T <: Real
    Exo2SplitBinion{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            Perplex{T}(c, zero(T))
        ),
        zero(ExoPerplex{T})
    )
end

function Exo2SplitBinion(a::T, b::T) where T <: Real
    Exo2SplitBinion{T}(
        ExoPerplex{T}(
            Perplex{T}(a, b),
            zero(Perplex{T})
        ),
        zero(ExoPerplex{T})
    )
end

function Exo2SplitBinion(a::T) where T <: Real
    Exo2SplitBinion{T}(
        ExoPerplex{T}(
            Perplex{T}(a, zero(T)),
            zero(Perplex{T})
        ),
        zero(ExoPerplex{T})
    )
end

function Exo2SplitBinion(a::Real, b::Real)
    Exo2SplitBinion(promote(a, b)...)
end

function Exo2SplitBinion(a::Real, b::Real, c::Real)
    Exo2SplitBinion(promote(a, b, c)...)
end

function Exo2SplitBinion(a::Real, b::Real, c::Real, d::Real)
    Exo2SplitBinion(promote(a, b, c, d)...)
end

function Exo2SplitBinion(a::Real, b::Real, c::Real, d::Real, f::Real)
    Exo2SplitBinion(promote(a, b, c, d, f)...)
end

function Exo2SplitBinion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    Exo2SplitBinion(promote(a, b, c, d, f, g)...)
end

function Exo2SplitBinion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    Exo2SplitBinion(promote(a, b, c, d, f, g, h)...)
end

function Exo2SplitBinion(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    Exo2SplitBinion(promote(a, b, c, d, f, g, h, j)...)
end

function Exo2SplitBinion(z::BiExoplex{T}) where T <: Real
    Exo2SplitBinion(z.l.l, zero(T), z.l.r, zero(T), z.r.l, zero(T), z.r.r)
end

"""
    unreal(z::Exo2SplitBinion)

The unreal part of a 2-exo-split-binion is a 7-vector.
"""
function unreal(z::Exo2SplitBinion)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo2SplitBinion)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", s: ")
    print(io, z.l.l.r)
    print(io, ", a: ")
    print(io, z.l.r.l)
    print(io, ", sa: ")
    print(io, z.l.r.r)
    print(io, ", b: ")
    print(io, z.r.l.l)
    print(io, ", sb: ")
    print(io, z.r.l.r)
    print(io, ", ab: ")
    print(io, z.r.r.l)
    print(io, ", (sa)b: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{Exo2SplitBinion{T}}) where T <: Real
    Exo2SplitBinion{T}(random(ExoPerplex{T}), random(ExoPerplex{T}))
end
