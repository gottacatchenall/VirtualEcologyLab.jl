
"""
    Population

    TODO
"""
struct Location
coordinate::Vector{Float64}
end

"""
    Metapopulation

    TODO
"""
struct LocationSet
populations::Vector{Location}
end


"""
    Location()
"""
Location(;number_of_dimensions=2) = Location(rand(Uniform(), number_of_dimensions))



"""
LocationSet()

    Constructs a Metapopulation.
"""
LocationSet(;numlocations::Int=10) = LocationSet([Location() for p in 1:numlocations])


struct PoissonProcess <: AbstractLocationSetGenerator
    numlocations::Int
    PoissonProcess(;numlocations::Number=20) = new(numlocations)
end
(proc::PoissonProcess)() = LocationSet(numlocations=proc.numlocations)

