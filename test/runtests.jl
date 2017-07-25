using CayleyDickson
using Base.Test: @testset

@testset "Cplex" begin include("cplex_test.jl") end
@testset "Perplex" begin include("perplex_test.jl") end
@testset "Exoplex" begin include("exoplex_test.jl") end
@testset "Quaternion" begin include("quaternion_test.jl") end
@testset "SplitQuaternion" begin include("splitquaternion_test.jl") end
@testset "ExoComplex" begin include("exocomplex_test.jl") end
@testset "ExoPerplex" begin include("exoperplex_test.jl") end
@testset "Exo2Real" begin include("exo2real_test.jl") end
@testset "Octonion" begin include("octonion_test.jl") end
@testset "SplitOctonion" begin include("splitoctonion_test.jl") end
@testset "Exo1Quaternion" begin include("exo1quaternion_test.jl") end
@testset "Exo1SplitQuaternion" begin include("exo1splitquaternion_test.jl") end
@testset "Exo2Binion" begin include("exo2binion_test.jl") end
@testset "Exo2SplitBinion" begin include("exo2splitbinion_test.jl") end
@testset "Exo3Real" begin include("exo3real_test.jl") end
@testset "Sedenion" begin include("sedenion_test.jl") end
@testset "Exo4Real" begin include("exo4real_test.jl") end
