function simulate_trajectory(ves::VirtualEcosystem; ntimesteps = 1000)
    
    trajs = TrajectoryBundle(ves, ntimesteps)
    simulate_trajectory!(ves, trajs)
end

"""
    simulate_trajectory!(ves, traj::TrajectoryAssemblage)
"""
function simulate_trajectory!(ves, traj::TrajectoryBundle)
    nt = numtimes(traj)
    for t = 2:nt

        oldstate = timestep(traj, t-1)
        newstate = timestep(traj, t)

        simulate_timestep!(ves, oldstate, newstate)
    end
end

"""
simulate_timestep!(ves, oldstate, newstate)

the primary dispatch for mechanisms 
"""
function simulate_timestep!(ves, oldstate, newstate)

    for mech in mechanisms(ves)
        simulate!(mech, ves, oldstate, newstate)
    end
end


function iterateover!(
    ::Type{SingletonState}, 
    mechanism::AbstractMechanism,
    ves::VirtualEcosystem, 
    oldstate::State{T}, 
    newstate::State{T}) where {T <: AbstractMeasurement}

    for i in eachindex(oldstate)
        simulate!(mech, ves, oldstate[i], newstate[i])
    end
end