using CayleyDickson
using Base.Test: @testset

@testset "Cplex" begin include("cplex_test.jl") end
@testset "Perplex" begin include("perplex_test.jl") end
