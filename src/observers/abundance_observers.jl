struct Abundance <: AbstractObservationType
    value::Int64
end

Base.zero(::Type{Abundance}) = Abundance(0)