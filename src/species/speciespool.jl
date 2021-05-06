"""
DiscreteSpeciesPool
"""
struct DiscreteSpeciesPool <: AbstractSpeciesPool
    species::Vector{Species}
end

DiscreteSpeciesPool(numspecies::Int) = DiscreteSpeciesPool([Species() for s in 1:numspecies])


# discrete species divided into K different categories
"""
"""
struct DiscreteSepeciesPoolKpartite
end

# Species are defined by a distribution across trait space
"""
"""
struct ContinuousSpeciesPool
end

"""
# species are defined by a distribution,
# there are K categories of species with their own specific trait distribution
"""
struct ContinuousSpeciesPoolKpartite 
end