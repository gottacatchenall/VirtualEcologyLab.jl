struct DiffusionDispersal{T <: AbstractObservationType} <: AbstractMovementModel 
    DiffusionDispersal(obstype::Type) = new{obstype}()
end

function simulate(::DiffusionDispersal, old_state, new_state)
end