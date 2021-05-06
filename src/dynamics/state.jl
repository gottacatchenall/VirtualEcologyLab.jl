

struct State{MT <: AbstractMeasurement} <: AbstractState
    ptr::Array{MT}
end 

struct StateBundle
    states::Vector{State}
end

occupancy(s::State) = s

occupancy(s::StateBundle) = s 