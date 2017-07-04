# CayleyDickson.jl

[![Build Status](https://travis-ci.org/meirizarrygelpi/CayleyDickson.jl.svg?branch=master)](https://travis-ci.org/meirizarrygelpi/CayleyDickson.jl) [![Build status](https://ci.appveyor.com/api/projects/status/96ns6rckr5oi0o8k?svg=true)](https://ci.appveyor.com/project/meirizarrygelpi/cayleydickson-jl) [![Coverage Status](https://coveralls.io/repos/github/meirizarrygelpi/CayleyDickson.jl/badge.svg?branch=master)](https://coveralls.io/github/meirizarrygelpi/CayleyDickson.jl?branch=master) [![codecov.io](http://codecov.io/github/meirizarrygelpi/CayleyDickson.jl/coverage.svg?branch=master)](http://codecov.io/github/meirizarrygelpi/CayleyDickson.jl?branch=master)

This module provides arithmetic for Cayley-Dickson constructs.

There is an abstract type:
```julia
CDConstruct{T <: Number} <: Number
```
and three concrete types:
```julia
EllipticCD{T <: Number} <: CDConstruct{T}
HyperbolicCD{T <: Number} <: CDConstruct{T}
ParabolicCD{T <: Number} <: CDConstruct{T}
```
Each of the concrete types is a pair of elements.

A set of aliases are provided for convenience:
```julia
# 2-dimensional
Cplex{T <: Real} = EllipticCD{T}
Perplex{T <: Real} = HyperbolicCD{T}
Exoplex{T <: Real} = ParabolicCD{T}

# 4-dimensional
Hamilton{T <: Real} = EllipticCD{Cplex{T}}
Cockle{T <: Real} = HyperbolicCD{Cplex{T}}
ExoComplex{T <: Real} = ParabolicCD{Cplex{T}}
ExoPerplex{T <: Real} = ParabolicCD{Perplex{T}}
BiExoplex{T <: Real} = ParabolicCD{Exoplex{T}}

# 8-dimensional
Cayley{T <: Real} = EllipticCD{Hamilton{T}}
Zorn{T <: Real} = HyperbolicCD{Hamilton{T}}
ExoHamilton{T <: Real} = ParabolicCD{Hamilton{T}}
ExoCockle{T <: Real} = ParabolicCD{Cockle{T}}
BiExoComplex{T <: Real} = ParabolicCD{ExoComplex{T}}
BiExoPerplex{T <: Real} = ParabolicCD{ExoPerplex{T}}
TriExoplex{T <: Real} = ParabolicCD{BiExoplex{T}}

# 16-dimensional
Sedenion{T <: Real} = EllipticCD{Cayley{T}}
TetraExoplex{T <: Real} = ParabolicCD{TriExoplex{T}}
```

NEEDS TESTS.