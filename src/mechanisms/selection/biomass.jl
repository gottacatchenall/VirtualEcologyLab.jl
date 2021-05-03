struct Eating{OT <: Biomass} <: AbstractBioticSelectionModel
    F::Float64   # functional reponse
    consumer::Species  
    resource::Species  
end

function simulate(mechanism::Eating, old_state, new_state)

    # dC/dt = F_{ij} 

    old_state[consumer]
    old_state[resource]
end
