struct StochasticColonization <: AbstractDynamicsModel
    C::Float64
end

function simulate(model::StochasticColonization, landscape::AbstractLandscape, old_state::AbstractDynamicsState, new_state::AbstractDynamicsState)
    locs = locations(old_state)
    specs = species(old_state)

    for s in specs
        for l in locs
            this_state = state(old_state, l, s)
            occ = isoccupied(old_state, l, s)
        end
    end

end