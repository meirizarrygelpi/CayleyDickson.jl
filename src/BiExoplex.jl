"""
    BiExoplex{T <: Real} = ParabolicCD{Exoplex{T}}

A bi-exoplex number is a parabolic Cayley-Dickson construct with exoplex numbers.
"""
const BiExoplex{T <: Real} = ParabolicCD{Exoplex{T}}

function BiExoplex(z::Exoplex{T}) where T <: Real
    BiExoplex{T}(z, zero(Exoplex{T}))
end

function BiExoplex(a::T, b::T, c::T, d::T) where T <: Real
    BiExoplex{T}(Exoplex{T}(a, b), Exoplex{T}(c, d))
end

function BiExoplex(a::T, b::T, c::T) where T <: Real
    BiExoplex{T}(Exoplex{T}(a, b), Exoplex{T}(c, zero(T)))
end

function BiExoplex(a::T, b::T) where T <: Real
    BiExoplex{T}(Exoplex{T}(a, b), zero(Exoplex{T}))
end

function BiExoplex(a::T) where T <: Real
    BiExoplex{T}(Exoplex{T}(a, zero(T)), zero(Exoplex{T}))
end

function BiExoplex(a::Real, b::Real)
    BiExoplex(promote(a, b)...)
end

function BiExoplex(a::Real, b::Real, c::Real)
    BiExoplex(promote(a, b, c)...)
end

function BiExoplex(a::Real, b::Real, c::Real, d::Real)
    BiExoplex(promote(a, b, c, d)...)
end

function cloak(z::BiExoplex{T}) where T <: Real
    BiExoplex{T}(cloak(z.l), dagger(z.r))
end

function dagger(z::BiExoplex{T}) where T <: Real
    BiExoplex{T}(dagger(z.l), cloak(z.r))
end

function star(z::BiExoplex{T}) where T <: Real
    BiExoplex{T}(dagger(star(z.r)), star(z.l))
end

function selfstar(z::BiExoplex)
    (z + star(z) + dagger(z) + star(dagger(z))) / 4
end

function antiselfstar(z::BiExoplex)
    (z - star(z) + dagger(z) - star(dagger(z))) / 4
end

"""
    unreal(z::BiExoplex)

The unreal part of a bi-exoplex number is a 3-vector.
"""
function unreal(z::BiExoplex)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::BiExoplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", A: ")
    print(io, z.l.r)
    print(io, ", B: ")
    print(io, z.r.l)
    print(io, ", AB: ")
    print(io, z.r.r)
    print(io, "]")
end
