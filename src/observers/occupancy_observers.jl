struct Occupancy <: AbstractObservationType
    value::Bool
end
Base.zero(::Type{Occupancy}) = Occupancy(0)