using VirtualEcologicalLaboratory
using Distributions: Exponential


struct IncidenceFunctionModel <: AbstractModelAssemblage
    C::Matrix{Float64} # stores matrix of dispersal probability i -> j given i is occupied
    E::Float64
end