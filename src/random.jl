"""
    randomBigInt()

Compute a random `Int64` and return it coverted it to a `BigInt`.
"""
function randomBigInt()
    big(rand(Int64))
end

"""
    randomBigFloat()

Compute a random `Float64` and return it coverted it to a `BigFloat`.
"""
function randomBigFloat()
    big(rand(Float64))
end

"""
    randomBigRational

Compute two random `Int64`, convert them to `BigInt`, and return a `Rational` made with them.
"""
function randomBigRational()
    randomBigInt() // randomBigInt()
end
