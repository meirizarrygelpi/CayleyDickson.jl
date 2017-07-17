# CayleyDickson.jl

[![Build Status](https://travis-ci.org/meirizarrygelpi/CayleyDickson.jl.svg?branch=master)](https://travis-ci.org/meirizarrygelpi/CayleyDickson.jl) [![Build status](https://ci.appveyor.com/api/projects/status/96ns6rckr5oi0o8k?svg=true)](https://ci.appveyor.com/project/meirizarrygelpi/cayleydickson-jl) [![Coverage Status](https://coveralls.io/repos/github/meirizarrygelpi/CayleyDickson.jl/badge.svg?branch=master)](https://coveralls.io/github/meirizarrygelpi/CayleyDickson.jl?branch=master) [![codecov.io](http://codecov.io/github/meirizarrygelpi/CayleyDickson.jl/coverage.svg?branch=master)](http://codecov.io/github/meirizarrygelpi/CayleyDickson.jl?branch=master)

This module provides arithmetic for Cayley-Dickson constructs.

There is an abstract type:
```julia
Construct{T <: Number} <: Number
```
and three concrete types:
```julia
Elliptic{T <: Number} <: Construct{T}
Hyperbolic{T <: Number} <: Construct{T}
Parabolic{T <: Number} <: Construct{T}
```
Each of the concrete types is a pair of elements.

A set of aliases are provided for convenience:
```julia
# 2-dimensional
Cplex{T <: Real} = Elliptic{T}
Perplex{T <: Real} = Hyperbolic{T}
Exoplex{T <: Real} = Parabolic{T}

# 4-dimensional
Hamilton{T <: Real} = Elliptic{Cplex{T}}
Cockle{T <: Real} = Hyperbolic{Cplex{T}}
ExoComplex{T <: Real} = Parabolic{Cplex{T}}
ExoPerplex{T <: Real} = Parabolic{Perplex{T}}
BiExoplex{T <: Real} = Parabolic{Exoplex{T}}

# 8-dimensional
Cayley{T <: Real} = Elliptic{Hamilton{T}}
Zorn{T <: Real} = Hyperbolic{Hamilton{T}}
ExoHamilton{T <: Real} = Parabolic{Hamilton{T}}
ExoCockle{T <: Real} = Parabolic{Cockle{T}}
BiExoComplex{T <: Real} = Parabolic{ExoComplex{T}}
BiExoPerplex{T <: Real} = Parabolic{ExoPerplex{T}}
TriExoplex{T <: Real} = Parabolic{BiExoplex{T}}

# 16-dimensional
Sedenion{T <: Real} = Elliptic{Cayley{T}}
TetraExoplex{T <: Real} = Parabolic{TriExoplex{T}}
```

NEEDS DOCS.