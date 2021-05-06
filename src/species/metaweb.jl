
struct NicheModel <: AbstractMetaweb end  # wrapper around ecologicalnetworks.jl


species(sp::AbstractSpeciesPool) = sp.species
Base.length(sp::AbstractSpeciesPool) = Base.length(species(sp))