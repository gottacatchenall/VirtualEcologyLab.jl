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
    
    mechs = mechanisms(ves)

    for t = 2:nt
        for mech in mechs
            meas = measurement(mech)
            tensor = trajbundle[meas]
            tensor[t] = simulate!(mech, tensor[t-1], tensor[t])
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
    oldstate::Array{T,2}, 
    newstate::Array{T,2}) where {T}

    for i in eachindex(oldstate)
        newstate[i] = simulate!(mech, oldstate[i], newstate[i])
    end

    return newstate
end

