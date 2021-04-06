struct StaticEnvironmentalVariable{T} <: AbstractEnvironmentalVariable
    values::Array{T}
end

struct EnvironmentalObservation <: AbstractObservationType 
    values::Union{T, V} where { T <: Number, V <: AbstractArray }
end 


function generate(::Type{StaticEnvironmentalVariable}, ls::AbstractLocationSet, dist::Distribution)
    obs = [EnvironmentalObservation(rand(dist)) for p in 1:sizeof(ls)]
    sev = StaticEnvironmentalVariable(obs)
    return sev
end

