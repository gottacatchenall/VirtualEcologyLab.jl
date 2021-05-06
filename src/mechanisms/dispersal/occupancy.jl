struct StochasticColonization{Occupancy} <: AbstractDispersalModel{Occupancy}
    C::Float64
end

function simulate!(mechanism::StochasticColonization, ves::VirtualEcosystem, old_state::State, new_state::State)
    # iterate over singlestons
    oldstate .= newstate
    for s in species(ves)
        for l in locations(ves)
            oldsingleton = oldstate[s,l]
            if !oldsingleton & rand(Bernoulli(mechanism.C))
                newstate[s,l] = true
            end         
        end
    end
end

function simulate!(mechanism::StochasticColonization, old_state::SingletonState, new_state::SingletonState)
   
end


struct IncidenceFunctionColonization <: AbstractDispersalModel{Occupancy}
    C::Float64
    α::Float64
    kernel::Function
end

