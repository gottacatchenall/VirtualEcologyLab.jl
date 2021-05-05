struct StochasticColonization{Occupancy} <: AbstractDispersalModel{Occupancy}
    C::Float64
end

function simulate(mechanism::StochasticColonization, old_state::SingletonState, new_state::SingletonState)
    C = mechanism.C 
    occupied(old_state) ? new_state = 1 : new_state = rand(Bernoulli(C))
end

struct IncidenceFunctionColonization <: AbstractDispersalModel{Occupancy}
    C::Float64
    α::Float64
    kernel::Function
end

