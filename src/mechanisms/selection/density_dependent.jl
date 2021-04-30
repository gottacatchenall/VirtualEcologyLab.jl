struct DensityDependentSelection{T <: AbstractObservationType} <: AbstractSelectionModel 
    w::Float64
    K::Float64
    α::Float64
end

run!(::DensityDependentSelection)