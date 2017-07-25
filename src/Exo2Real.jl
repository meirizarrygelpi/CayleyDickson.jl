"""
    Exo2Real{T <: Real} = Parabolic{Exo1Real{T}}

A 2-exo-real number is a parabolic Cayley-Dickson construct with 1-exo-real numbers.
"""
const Exo2Real{T <: Real} = Parabolic{Exo1Real{T}}

function Exo2Real(z::Exo1Real{T}) where T <: Real
    Exo2Real{T}(z, zero(Exo1Real{T}))
end

function Exo2Real(a::T, b::T, c::T, d::T) where T <: Real
    Exo2Real{T}(Exo1Real{T}(a, b), Exo1Real{T}(c, d))
end

function Exo2Real(a::T, b::T, c::T) where T <: Real
    Exo2Real{T}(Exo1Real{T}(a, b), Exo1Real{T}(c, zero(T)))
end

function Exo2Real(a::T, b::T) where T <: Real
    Exo2Real{T}(Exo1Real{T}(a, b), zero(Exo1Real{T}))
end

function Exo2Real(a::T) where T <: Real
    Exo2Real{T}(Exo1Real{T}(a, zero(T)), zero(Exo1Real{T}))
end

function Exo2Real(a::Real, b::Real)
    Exo2Real(promote(a, b)...)
end

function Exo2Real(a::Real, b::Real, c::Real)
    Exo2Real(promote(a, b, c)...)
end

function Exo2Real(a::Real, b::Real, c::Real, d::Real)
    Exo2Real(promote(a, b, c, d)...)
end

function cloak(z::Exo2Real{T}) where T <: Real
    Exo2Real{T}(cloak(z.l), dagger(z.r))
end

function dagger(z::Exo2Real{T}) where T <: Real
    Exo2Real{T}(dagger(z.l), cloak(z.r))
end

function star(z::Exo2Real{T}) where T <: Real
    Exo2Real{T}(dagger(star(z.r)), star(z.l))
end

function selfstar(z::Exo2Real)
    (z + star(z) + dagger(z) + star(dagger(z))) / 4
end

function anti_selfstar(z::Exo2Real)
    (z - star(z) + dagger(z) - star(dagger(z))) / 4
end

"""
    unreal(z::Exo2Real)

The unreal part of a 2-exo-real number is a 3-vector.
"""
function unreal(z::Exo2Real)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::Exo2Real)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", a: ")
    print(io, z.l.r)
    print(io, ", b: ")
    print(io, z.r.l)
    print(io, ", ab: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{Exo2Real{T}}) where T <: Real
    Exo2Real{T}(random(Exo1Real{T}), random(Exo1Real{T}))
end
