struct RandomColonization{Occupancy} <: AbstractDispersalModel{Occupancy}
    C::Float64
end

function simulate!(
    mechanism::RandomColonization{Occupancy}, 
    oldstate::Array{Occupancy,2}, 
    newstate::Array{Occupancy,2})

    # this is where you would parallelize
    newstate = iterateover!(SingletonState,  mechanism, oldstate, newstate) 
end

function simulate!(
    mech::RandomColonization{Occupancy}, 
    oldstate::Occupancy, 
    newstate::Occupancy)
    
    if rand(Bernoulli(mech.C))  
        newstate = true
    end
    return newstate 
end