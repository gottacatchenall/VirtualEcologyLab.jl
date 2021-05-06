struct StochasticExtinction{Occupancy} <: AbstractDriftModel{Occupancy}
    E::Float64
end

function simulate(mechanism::StochasticExtinction, oldstate::State{Occupancy}, newstate::State{Occupancy})
    locs = locations(oldstate)
    specs = species(oldstate)

    for s in specs
        for l in locs
            this_state = state(oldstate, l, s)
            occ = isoccupied(oldstate, l, s)
        end
    end

end

struct IncidenceFunctionColonization <: AbstractDispersalModel
    C::Float64
    α::Float64
    kernel::Function
end

