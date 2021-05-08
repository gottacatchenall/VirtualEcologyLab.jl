function mean(traj::Trajectory, ::Type{Species}) 
    _meanbyspecies(traj)
end 

function mean(traj::Trajectory, ::Type{LocationSet}) 
    _meanbylocation(traj)
end

function mean(traj::Trajectory, ::Type{Time}) 
    _meanbytime(traj)
end

function mean(traj::Trajectory) 
    _totalmean(traj)
end


function _meanbyspecies(traj) 
end 


function _meanbylocation(traj) 
end 


function _meanbytime(traj) 

end 


function _totalmean(traj)
    sum = 0 
    ct = 0
    for i in eachindex(traj.data)
        sum += Int(traj.data[i])
        ct += 1
    end
    return (sum/ct)
end 