struct StochasticColonization{Occupancy} <: AbstractDispersalModel{Occupancy}
    C::Float64
end

function simulate!(
    mechanism::StochasticColonization, 
    ves::VirtualEcosystem, 
    oldstate::Array{Occupancy,2}, 
    newstate::Array{Occupancy,2})

    # this is where you would parallelize
    iterateover!(SingletonState,  mechanism, ves, oldstate, newstate) 
end

function simulate!(
    mech::StochasticColonization, 
    ves::VirtualEcosystem, 
    oldstate::Occupancy, 
    newstate::Occupancy)

    c = mech.C

    if unoccupied(oldstate) && rand(Bernoulli(c))
        @show "attempting assignment "
        set!(newstate, true)
        @show newstate
    end
end