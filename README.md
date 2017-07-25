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
Each of the concrete types is a pair of elements. These concrete types can be used and combined in a recursive way.

Basic arithmetic operations are implemented:
```julia
(+), (-), (*), (/), (\), inv, conj
```
A set of aliases are provided for convenience. There are three 2-dimensional algebras:
```julia
Binion{T <: Real} = Elliptic{T}
SplitBinion{T <: Real} = Hyperbolic{T}
Exo1Real{T <: Real} = Parabolic{T}
```
A `Binion` is a [complex number](https://en.wikipedia.org/wiki/Complex_number) (a somewhat janky version of the built-in `Complex`). A `SplitBinion` is a [split-complex number](https://en.wikipedia.org/wiki/Split-complex_number). An `Exo1Real` is also known as a [dual number](https://en.wikipedia.org/wiki/Dual_number). The prefix "exo" is used due to a relation with [exterior algebras](https://en.wikipedia.org/wiki/Exterior_algebra). The `Exo1Real` type is related to the [multivector algebra](https://en.wikipedia.org/wiki/Multivector) of 1 unit 1-blade.

All 2-dimensional types have a multiplication operation that is commutative, associative, alternative, and flexible. They are all composition algebras.

There are five 4-dimensional algebras:
```julia
Quaternion{T <: Real} = Elliptic{Binion{T}}
SplitQuaternion{T <: Real} = Hyperbolic{Binion{T}}
Exo1Binion{T <: Real} = Parabolic{Binion{T}}
Exo1SplitBinion{T <: Real} = Parabolic{SplitBinion{T}}
Exo2Real{T <: Real} = Parabolic{Exo1Real{T}}
```
A `Quaternion` is a traditional Hamilton [quaternion](https://en.wikipedia.org/wiki/Quaternion). Note that unlike most conventions, the units for a quaternion in this module are `i`, `j`, and `ij` (not `k`). A `SplitQuaternion` is a [split-quaternion](https://en.wikipedia.org/wiki/Split-quaternion). An `Exo2Real` is **not** a [hyper-dual number](http://adl.stanford.edu/hyperdual/), since multiplication is non-commutative. The `Exo2Real` is related to the multivector algebra of 2 orthonormal 1-blades. The `Exo1Binion` and `Exo1SplitBinion` are **not** related to dual complex numbers or dual split-complex numbers, since the imaginary/split-imaginary units anti-commute with the parabolic unit.

All 4-dimensional types have a multiplication operation that is non-commutative, associative, alternative, and flexible. They are all composition algebras.

There are seven 8-dimensional types:
```julia
Octonion{T <: Real} = Elliptic{Quaternion{T}}
SplitOctonion{T <: Real} = Hyperbolic{Quaternion{T}}
Exo1Quaternion{T <: Real} = Parabolic{Quaternion{T}}
Exo1SplitQuaternion{T <: Real} = Parabolic{SplitQuaternion{T}}
Exo2Binion{T <: Real} = Parabolic{Exo1Binion{T}}
Exo2SplitBinion{T <: Real} = Parabolic{Exo1SplitBinion{T}}
Exo3Real{T <: Real} = Parabolic{Exo2Real{T}}
```
An `Octonion` is a traditional [octonion](https://en.wikipedia.org/wiki/Octonion). A `SplitOctonion` is a [split-octonion](https://en.wikipedia.org/wiki/Split-octonion). The `Exo3Real` type is related to the multivector algebra of 3 orthonormal 1-blades.

All 8-dimensional types have a multiplication operation that is non-commutative, non-associative, alternative, and flexible. They are all composition algebras.

There are nine 16-dimensional types:
```julia
Sedenion{T <: Real} = Elliptic{Octonion{T}}
SplitSedenion{T <: Real} = Hyperbolic{Octonion{T}} # Not implemented yet
Exo1Octonion{T <: Real} = Parabolic{Octonion{T}} # Not implemented yet
Exo1SplitOctonion{T <: Real} = Parabolic{SplitOctonion{T}} # Not implemented yet
Exo2Quaternion{T <: Real} = Parabolic{Exo1Quaternion{T}} # Not implemented yet
Exo2SplitQuaternion{T <: Real} = Parabolic{Exo1SplitQuaternion{T}} # Not implemented yet
Exo3Binion{T <: Real} = Parabolic{Exo2Binion{T}} # Not implemented yet
Exo3SplitBinion{T <: Real} = Parabolic{Exo2SplitBinion{T}} # Not implemented yet
Exo4Real{T <: Real} = Parabolic{Exo3Real{T}}
```
A `Sedenion` is a traditional [sedenion](https://en.wikipedia.org/wiki/Sedenion). The `Exo4Real` type is related to the multivector algebra of 4 orthonormal 1-blades.

All 16-dimensional types have a multiplication operation that is non-commutative, non-associative, non-alternative, and flexible. None are composition algebras.

NEEDS DOCS.