
# each panel is a species 
function plot_occupancy_timeseries(traj::Trajectory; ::Type{Species})

    
    for sp in species(traj)
        numocc = 0
        mean(traj, sp, Time) # should return a timeseries for each species
        for loc in locations(traj)
        
        end
    end
end


# each panel is a location
function plot_occupancy_timeseries(traj::Trajectory; ::Type{Location})
    
end



function plot_occupancy_timeseries(traj::Trajectory)
    
end
