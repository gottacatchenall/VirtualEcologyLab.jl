struct StochasticColonization{Occupancy} <: AbstractDispersalModel{Occupancy}
    C::Float64
end

function simulate!(
    mechanism::StochasticColonization, 
    ves::VirtualEcosystem, 
    oldstate::StateBundle, 
    newstate::StateBundle)
    
    oldocc = occupancy(oldstate)
    newocc = occupancy(newstate)

    # this is where you would parallelize
    iterateover!(SingletonState,  mechanism, ves, oldocc, newocc) 
end

function simulate!(
    mech::StochasticColonization, 
    ves::VirtualEcosystem, 
    oldstate::SingletonState, 
    newstate::SingletonState)

    c = mechanism.C

    if unoccupied(oldstate) && rand(Bernoulli(c))
        newstate = true
    end
end