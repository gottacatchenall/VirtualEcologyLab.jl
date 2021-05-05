

"""
Location()
"""
Location(;number_of_dimensions=2) = Location(rand(Uniform(), number_of_dimensions))



"""
LocationSet()

Constructs a Metapopulation.
"""
LocationSet(;numlocations::Int=10) = LocationSet([Location() for p in 1:numlocations])

Base.length(ls::LocationSet) = length(ls.locations)
Base.size(ls::LocationSet) = length(ls.locations)

numlocations(ls::LocationSet) = size(ls)


struct PoissonProcess <: AbstractLocationSetGenerator end

generate(::Type{PoissonProcess}, np::Int) = LocationSet(numlocations=np)

