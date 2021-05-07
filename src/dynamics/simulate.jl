function simulate_trajectory(ves::VirtualEcosystem; ntimesteps = 1000)
    
    trajs = TrajectoryBundle(ves, ntimesteps)
    simulate_trajectory!(ves, trajs)
    return trajs
end

"""
    simulate_trajectory!(ves, traj::TrajectoryAssemblage)
"""
function simulate_trajectory!(ves, trajbundle::TrajectoryBundle)
    nt = numtimes(trajbundle[1])
    
    for t = 2:nt
        for mech in mechanisms(ves)
            meas = measurement(mech)
            tensor = trajbundle[meas]
            simulate!(mech, ves, tensor[t-1], tensor[t])
        end
        
    end
end

"""
simulate_timestep!(ves, oldstate, newstate)

the primary dispatch for mechanisms 
"""
function simulate_timestep!(ves, oldstate, newstate)

   
end


function iterateover!(
    ::Type{SingletonState}, 
    mech::AbstractMechanism,
    ves::VirtualEcosystem, 
    oldstate::Array{T,2}, 
    newstate::Array{T,2}) where {T <: AbstractMeasurement}

    for i in eachindex(oldstate)
        simulate!(mech, ves, oldstate[i], newstate[i])
    end
end