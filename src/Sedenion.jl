"""
    Sedenion{T <: Real} = EllipticCD{Cayley{T}}

A sedenion is an elliptic Cayley-Dickson construct with Cayley octonions.
"""
const Sedenion{T <: Real} = EllipticCD{Cayley{T}}

function Sedenion(z::Cayley{T}) where T <: Real
    Sedenion{T}(z, zero(Cayley{T}))
end

function Sedenion(z::Hamilton{T}) where T <: Real
    Sedenion{T}(
        Cayley{T}(z, zero(Hamilton{T})),
        zero(Cayley{T})
    )
end

function Sedenion(z::Cplex{T}) where T <: Real
    Sedenion{T}(
        Cayley{T}(Hamilton{T}(z, zero(Cplex{T})),
        zero(Hamilton{T})),
        zero(Cayley{T})
    )
end

"""
    unreal(z::Sedenion)

The unreal part of a sedenion is a 15-vector.
"""
function unreal(z::Sedenion)
    vcat(unreal(z.l), asarray(z.r))
end

function show(io::IO, z::Sedenion)
    print(io, "[1: ")
    print(io, z.l.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.l.r)
    print(io, ", j: ")
    print(io, z.l.l.r.l)
    print(io, ", ij: ")
    print(io, z.l.l.r.r)
    print(io, ", k: ")
    print(io, z.l.r.l.l)
    print(io, ", ik: ")
    print(io, z.l.r.l.r)
    print(io, ", jk: ")
    print(io, z.l.r.r.l)
    print(io, ", (ij)k: ")
    print(io, z.l.r.r.r)
    print(io, ", m: ")
    print(io, z.r.l.l.l)
    print(io, ", im: ")
    print(io, z.r.l.l.r)
    print(io, ", jm: ")
    print(io, z.r.l.r.l)
    print(io, ", (ij)m: ")
    print(io, z.r.l.r.r)
    print(io, ", km: ")
    print(io, z.r.r.l.l)
    print(io, ", (ik)m: ")
    print(io, z.r.r.l.r)
    print(io, ", (jk)m: ")
    print(io, z.r.r.r.l)
    print(io, ", ((ij)k)m: ")
    print(io, z.r.r.r.r)
    print(io, "]")
end

function random(::Type{Sedenion{T}}) where T <: Real
    Sedenion{T}(random(Cayley{T}), random(Cayley{T}))
end
