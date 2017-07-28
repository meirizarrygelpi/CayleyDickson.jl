__precompile__()

module CayleyDickson

import Base: +, -, *, /, \, ==
import Base: real, isreal, conj, inv, abs2, zero, one, iszero
import Base: show, promote_rule, widen, convert, float
# import Unreal: unreal

"Error when finding the inverse of a zero divisor."
const ZeroDivisorInverse = "inverse of zero divisor"

"Error when the denominator in a quotient is zero."
const ZeroDenominator = "denominator is zero"

include("Construct.jl")
include("Elliptic.jl")
include("Binion.jl")
include("Quaternion.jl")
include("Octonion.jl")
include("Hyperbolic.jl")
include("SplitBinion.jl")
include("SplitQuaternion.jl")
include("SplitOctonion.jl")
include("Parabolic.jl")
include("Exo1Real.jl")
include("Exo2Real.jl")
include("Exo1Binion.jl")
include("Exo1SplitBinion.jl")
include("Exo3Real.jl")
include("Exo2Binion.jl")
include("Exo2SplitBinion.jl")
include("Exo1Quaternion.jl")
include("Exo1SplitQuaternion.jl")
include("Sedenion.jl")
include("Exo4Real.jl")
include("random.jl")
include("real.jl")

# Types
export Construct, Elliptic, Hyperbolic, Parabolic,
       Binion, SplitBinion, Exo1Real,
       Quaternion, SplitQuaternion, Exo2Real, Exo1Binion, Exo1SplitBinion,
       Octonion, SplitOctonion, Exo1Quaternion, Exo1SplitQuaternion, Exo3Real, Exo2Binion, Exo2SplitBinion,
       Sedenion, Exo4Real

# Methods
export unreal, array, iszerodivisor, random, quadrance,
       commutator, associator, jacobiator, alternatorL, alternatorR, flexator,
       anti_commutator, anti_associator, anti_alternatorL, anti_alternatorR, anti_flexator,
       cloak, dagger, star, selfstar, anti_selfstar

end
