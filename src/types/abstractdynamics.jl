abstract type AbstractDynamicsModel end

abstract type AbstractDispersalModel <: AbstractDynamicsModel end
abstract type AbstractSelectionModel <: AbstractDynamicsModel end
abstract type AbstractDriftModel <: AbstractDynamicsModel end

struct ModelAssemblage 
    models::AbstractVector{AbstractDynamicsModel}
end 


function combinemodels(a::AbstractDynamicsModel, b::AbstractDynamicsModel) 
    checktypes(a,b) && ModelAssemblage([a,b])
end

Base.:+(a::Union{AbstractDynamicsModel, ModelAssemblage}, b::Union{AbstractDynamicsModel, ModelAssemblage}) = combinemodels(a, b)


