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

    # make sure each mechanism corresponds with state

    for mech in mechanisms(ves)
        simulate!(mech, ves, oldstate, newstate)
    end
end