__precompile__()

module CayleyDickson

import Base: +, -, *, /, \, real, isreal, conj, inv, abs2, show, zero, one, iszero, ==
# import Unreal: unreal

"Error when finding the inverse of a zero divisor."
const ZeroDivisorInverse = "inverse of zero divisor"

"Error when the denominator in a quotient is zero."
const ZeroDenominator = "denominator is zero"

include("CDConstruct.jl")
include("EllipticCD.jl")
include("Cplex.jl")
include("Hamilton.jl")
include("Cayley.jl")
include("HyperbolicCD.jl")
include("Perplex.jl")
include("Cockle.jl")
include("Zorn.jl")
include("ParabolicCD.jl")
include("Exoplex.jl")
include("BiExoplex.jl")
include("ExoComplex.jl")
include("ExoPerplex.jl")
include("TriExoplex.jl")
include("BiExoComplex.jl")
include("BiExoPerplex.jl")
include("ExoHamilton.jl")
include("ExoCockle.jl")
include("Sedenion.jl")
include("TetraExoplex.jl")
include("random.jl")

# Types
export CDConstruct, EllipticCD, HyperbolicCD, ParabolicCD,
       Cplex, Perplex, Exoplex,
       Hamilton, Cockle, BiExoplex, ExoComplex, ExoPerplex,
       Cayley, Zorn, ExoHamilton, ExoCockle, TriExoplex, BiExoComplex, BiExoPerplex,
       Sedenion, TetraExoplex

# Methods
export unreal, asarray, iszerodivisor, random,
       commutator, associator, jacobiator, alternatorL, alternatorR,
       cloak, dagger, star, selfstar, antiselfstar

end
