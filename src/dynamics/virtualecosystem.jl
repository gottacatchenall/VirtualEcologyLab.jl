"""
    VirtualEcosystem
"""

struct VirtualEcosystem
    locations::LocationSet
    speciespool::AbstractSpeciesPool
    mechanisms::MechanismAssemblage
end



species(ves) = ves.speciespool
locations(ves) = ves.locations
mechanisms(ves::VirtualEcosystem) = ves.mechanisms


numspecies(ves) = length(species(ves))
numlocations(ves::VirtualEcosystem) = size(locations(ves))


measurement(a::T) where {V, T <: AbstractDriftModel{V}} = V
measurement(a::T) where {V, T <: AbstractDispersalModel{V}} = V
measurements(ves::VirtualEcosystem) = [measurement(mech) for mech in mechanisms(ves)]
