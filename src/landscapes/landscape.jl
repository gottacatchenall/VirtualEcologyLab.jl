struct Landscape{LT <: AbstractLocationSet, ET <: Union{AbstractEnvironmentalVariable, Vector{AbstractEnvironmentalVariable}} }
    location::LT
    environment::ET
end 