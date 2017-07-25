"""
    Exo2SplitBinion{T <: Real} = Parabolic{Exo1SplitBinion{T}}

A 2-exo-split-binion is a parabolic Cayley-Dickson construct with 1-exo-split-binions.
"""
const Exo2SplitBinion{T <: Real} = Parabolic{Exo1SplitBinion{T}}

function Exo2SplitBinion(z::Exo1SplitBinion{T}) where T <: Real
    Exo2SplitBinion{T}(z, zero(Exo1SplitBinion{T}))
end

function Exo2SplitBinion(z::SplitBinion{T}) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(z, zero(SplitBinion{T})),
        zero(Exo1SplitBinion{T})
    )
end

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            SplitBinion{T}(c, d)
        ),
        Exo1SplitBinion{T}(
            SplitBinion{T}(f, g),
            SplitBinion{T}(h, j)
        )
    )
end

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            SplitBinion{T}(c, d)
        ),
        Exo1SplitBinion{T}(
            SplitBinion{T}(f, g),
            SplitBinion{T}(h, zero(T))
        )
    )
end

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            SplitBinion{T}(c, d)
        ),
        Exo1SplitBinion{T}(
            SplitBinion{T}(f, g),
            zero(SplitBinion{T})
        )
    )
end

function Exo2SplitBinion(a::T, b::T, c::T, d::T, f::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            SplitBinion{T}(c, d)
        ),
        Exo1SplitBinion{T}(
            SplitBinion{T}(f, zero(T)),
            zero(SplitBinion{T})
        )
    )
end

function Exo2SplitBinion(a::T, b::T, c::T, d::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            SplitBinion{T}(c, d)
        ),
        zero(Exo1SplitBinion{T})
    )
end

function Exo2SplitBinion(a::T, b::T, c::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            SplitBinion{T}(c, zero(T))
        ),
        zero(Exo1SplitBinion{T})
    )
end

function Exo2SplitBinion(a::T, b::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, b),
            zero(SplitBinion{T})
        ),
        zero(Exo1SplitBinion{T})
    )
end

function Exo2SplitBinion(a::T) where T <: Real
    Exo2SplitBinion{T}(
        Exo1SplitBinion{T}(
            SplitBinion{T}(a, zero(T)),
            zero(SplitBinion{T})
        ),
        zero(Exo1SplitBinion{T})
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

function Exo2SplitBinion(z::Exo2Real{T}) where T <: Real
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
    Exo2SplitBinion{T}(random(Exo1SplitBinion{T}), random(Exo1SplitBinion{T}))
end
