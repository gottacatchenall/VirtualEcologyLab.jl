struct DiffusionDispersal{T <: AbstractObservationType} <: AbstractDispersalModel 
    DiffusionDispersal(obstype::Type) = new{obstype}()
end

function simulate(::DiffusionDispersal, old_state, new_state)
end