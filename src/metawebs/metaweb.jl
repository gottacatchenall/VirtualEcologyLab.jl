struct SingleSpecies <: AbstractMetaweb 
    adjacency_matrix::Matrix
    SingleSpecies() = new(zeros(1,1))
end 

struct NicheModel <: AbstractMetaweb end  # wrapper around ecologicalnetworks.jl

