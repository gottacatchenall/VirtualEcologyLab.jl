function simulate(mechanism::AbstractMutationModel, old_state, new_state)
    # dispersal is a process which alters the global state, independent of species 
    for s in species(old_state)
        simulate(mechanism, old_state[s], new_state[s])
    end
end