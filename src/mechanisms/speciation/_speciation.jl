function simulate(mechanism::AbstractSpeciationModel, old_state, new_state)
    # speciation is a global process which can on all species independently, 
    # where if the trait distribution for a given location of species is different 
    # enough from the rest it becomes a new species and is added to metaweb 
    for s in species(old_state)
        simulate(mechanism, old_state[s], new_state[s])
    end
end

