function simulate(mechanism::AbstractSelectionModel, old_state, new_state)
    # selection is a local process which can on all species independently (abiotic selection)
    # or between pairs of species (biotic selection). Only first order interactions are possible for now
    for s in species(old_state)
        simulate(mechanism, old_state[s], new_state[s])
    end
end