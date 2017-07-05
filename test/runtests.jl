using CayleyDickson
using Base.Test: @testset

@testset "Cplex" begin include("cplex_test.jl") end
@testset "Perplex" begin include("perplex_test.jl") end
@testset "Exoplex" begin include("exoplex_test.jl") end
@testset "Hamilton" begin include("hamilton_test.jl") end
@testset "Cockle" begin include("cockle_test.jl") end
@testset "ExoComplex" begin include("exocomplex_test.jl") end
@testset "ExoPerplex" begin include("exoperplex_test.jl") end
@testset "BiExoplex" begin include("biexoplex_test.jl") end
@testset "Cayley" begin include("cayley_test.jl") end
@testset "Zorn" begin include("zorn_test.jl") end
