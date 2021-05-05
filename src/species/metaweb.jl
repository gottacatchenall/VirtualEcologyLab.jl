
struct NicheModel <: AbstractMetaweb end  # wrapper around ecologicalnetworks.jl


species(sp::SpeciesPool) = sp.species
Base.length(sp::SpeciesPool) = Base.length(species(sp))