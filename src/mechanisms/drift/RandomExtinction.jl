struct RandomExtinction{Occupancy} <: AbstractDispersalModel{Occupancy}
    E::Float64
end

function simulate!(
    mechanism::RandomExtinction{Occupancy}, 
    oldstate::Array{Occupancy,2}, 
    newstate::Array{Occupancy,2})

    # this is where you would parallelize
    newstate = iterateover!(SingletonState,  mechanism, oldstate, newstate) 
    return newstate
end

function simulate!(
    mech::RandomExtinction{Occupancy}, 
    oldstate::Occupancy,
    newstate::Occupancy)

    e = mech.E 
    if rand(Bernoulli(e))
        newstate = false 
    end
    return newstate
end