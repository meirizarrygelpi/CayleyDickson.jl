"""
    TetraExoplex{T <: Real} = ParabolicCD{TriExoplex{T}}

A tetra-exoplex number is a parabolic Cayley-Dickson construct with tri-exoplex numbers.
"""
const TetraExoplex{T <: Real} = ParabolicCD{TriExoplex{T}}

function TetraExoplex(z::TriExoplex{T}) where T <: Real
    TetraExoplex{T}(z, zero(TriExoplex{T}))
end

function TetraExoplex(z::BiExoplex{T}) where T <: Real
    TetraExoplex{T}(
        TriExoplex{T}(z, zero(BiExoplex{T})),
        zero(TriExoplex{T})
    )
end

function TetraExoplex(z::Exoplex{T}) where T <: Real
    TetraExoplex{T}(
        TriExoplex{T}(
            BiExoplex{T}(z, zero(Exoplex{T})),
            zero(BiExoplex{T})),
        zero(TriExoplex{T})
    )
end

function cloak(z::TetraExoplex{T}) where T <: Real
    TetraExoplex{T}(cloak(z.l), dagger(z.r))
end

function dagger(z::TetraExoplex{T}) where T <: Real
    TetraExoplex{T}(dagger(z.l), cloak(z.r))
end

function star(z::TetraExoplex{T}) where T <: Real
    TetraExoplex{T}(dagger(star(z.r)), star(z.l))
end

function selfstar(z::TetraExoplex)
    (z + star(z) + dagger(z) + star(dagger(z))) / 4
end

function antiselfstar(z::TetraExoplex)
    (z - star(z) + dagger(z) - star(dagger(z))) / 4
end

"""
    unreal(z::TetraExoplex)

The unreal part of a tri-exoplex number is a 15-vector.
"""
function unreal(z::TetraExoplex)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::TetraExoplex)
    print(io, "[1: ")
    print(io, z.l.l.l.l)
    print(io, ", A: ")
    print(io, z.l.l.l.r)
    print(io, ", B: ")
    print(io, z.l.l.r.l)
    print(io, ", AB: ")
    print(io, z.l.l.r.r)
    print(io, ", C: ")
    print(io, z.l.r.l.l)
    print(io, ", AC: ")
    print(io, z.l.r.l.r)
    print(io, ", BC: ")
    print(io, z.l.r.r.l)
    print(io, ", (AB)C: ")
    print(io, z.l.r.r.r)
    print(io, ", D: ")
    print(io, z.r.l.l.l)
    print(io, ", AD: ")
    print(io, z.r.l.l.r)
    print(io, ", BD: ")
    print(io, z.r.l.r.l)
    print(io, ", (AB)D: ")
    print(io, z.r.l.r.r)
    print(io, ", CD: ")
    print(io, z.r.r.l.l)
    print(io, ", (AC)D: ")
    print(io, z.r.r.l.r)
    print(io, ", (BC)D: ")
    print(io, z.r.r.r.l)
    print(io, ", ((AB)C)D: ")
    print(io, z.r.r.r.r)
    print(io, "]")
end
