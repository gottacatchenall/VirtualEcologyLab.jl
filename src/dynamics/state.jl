

struct State{MT <: AbstractMeasurement} <: AbstractState
    ptr::Array{MT}
end 

struct StateBundle
    states::Vector{State}
end



occupancy(s::State) = s
function occupancy(sb::StateBundle) 
    for st in sb 
        if measurement(st) == Occupancy
            return st
        end
    end
end

states(sb::StateBundle) = sb.states
Base.length(sb::StateBundle) = length(states(sb))

Base.iterate(sb::StateBundle) = Base.iterate(states(sb))
Base.iterate(sb::StateBundle, i::Int) = Base.iterate(states(sb), i)

