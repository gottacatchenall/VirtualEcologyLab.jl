struct Trajectory{MT} <: AbstractTrajectory
    data::Array{MT,3}
    numspecies::Int
    numlocations::Int
    numtimes::Int 
    function Trajectory{T}(x::Array{T,3}) where {T}
        new{T}(x, size(x)...)
    end
end
Base.getindex(traj::Trajectory, t::Int) = traj.data[:,:,t]
Base.getindex(traj::Trajectory, ::Colon, ::Colon, t::Int) = traj.data[:,:,t]

Base.setindex!(traj::Trajectory{T}, arr::Array{T,2}, t::Int) where {T}= begin
    traj.data[:,:,t] = arr
end


function Trajectory(t::Type{T}, ns::Int, nl::Int, nt::Int) where {T}
    Trajectory{t}(zeros(t,ns,nl,nt))
end

function Trajectory(t::Type{T}, ntimesteps::Int, ves::VirtualEcosystem) where {T }
    ns = numspecies(ves)
    nl = numlocations(ves)
    return Trajectory(t, ns,nl,ntimesteps)
end

Base.getindex(t::Trajectory{N}, a::Any, b::Any, c::Any) where {N} = Base.getindex(t.data, a,b,c)
obstype(t::Trajectory{N}) where {N} = N
measurement(t::Trajectory{N}) where {N} = N

Base.show(io::IO, t::Trajectory) = Base.show(io, "Trajectory with $(obstype(t)) data.")

struct TrajectoryBundle
    trajectories::Vector{Trajectory}
end


function TrajectoryBundle(ves, ntimesteps)
    meas = measurements(ves)
    trajs = []

    # have to make unique for each meausrement
    for m in meas 
        traj = Trajectory(m, ntimesteps, ves)
        push!(trajs, traj)
    end
    return TrajectoryBundle(trajs)
end

# nothing to see here...
species(t::Trajectory) = t[1:length(t[:,1,1]), :, :]
locations(t::Trajectory) = t[:,1:length(t[1,:,1]), :]
times(t::Trajectory) = t[:,:,1:length(t[1,1,:])]

numlocations(t::Trajectory) = t.numlocations
numspecies(t::Trajectory) = t.numspecies
numtimes(t::Trajectory) = t.numtimes


Base.size(t::Trajectory) = Base.size(t.data)

numlocations(t::TrajectoryBundle) = size(t[1])[1]
numspecies(t::TrajectoryBundle) = size(t[1])[2]
numtimes(t::TrajectoryBundle) = size(t[1])[3]



trajectories(t::TrajectoryBundle) = t.trajectories
Base.getindex(t::TrajectoryBundle, i::Int) = (trajectories(t))[i]


# todo this lookup could be saved if trajbundle stores a list of pointers
# for each measurement 

Base.getindex(trajbundle::TrajectoryBundle, mech::Type{T}) where {T} = begin
    for traj in trajbundle
        if measurement(traj) == mech
            return traj
        end
    end
end

timestep(traj::Trajectory, time::Int) = times(traj)[:,:,time]


Base.iterate(trajbundle::TrajectoryBundle) = Base.iterate(trajectories(trajbundle))

Base.iterate(trajbundle::TrajectoryBundle, i::Int) = Base.iterate(trajectories(trajbundle), i)

Base.getindex(traj::Trajectory{T}, i::Int64) where {T} = traj[:,:,i]
