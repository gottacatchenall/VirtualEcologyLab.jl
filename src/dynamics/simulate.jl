function simulate(ves::VirtualEcosystem; ntimesteps = 1000)
    
    trajs = TrajectoryAssemblage(ves, ntimesteps)
    simulate!(ves, traj)
end


function simulate!(ves, traj::Trajectory)
    for model in models(ves)
        simulate(model, old_state, new_state)
    end
end

