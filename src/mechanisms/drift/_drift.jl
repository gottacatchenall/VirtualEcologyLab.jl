function simulate!(mechanism::AbstractDriftModel, old_state, new_state)
    # drift is independent of location and other species 
    locs = locations(old_state)
    specs = species(old_state)

    for l in locs
        for s in specs
            simulate(mechanism, old_state[l][s], new_state[l][s])
        end
    end
end