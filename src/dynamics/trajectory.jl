struct Trajectory{OT <: AbstractMeasurement}
    tensor::Array{OT, 3}
end

function Trajectory(t::Type{T}, ns::Int, nl::Int, nt::Int) where {T <: AbstractMeasurement}
    Trajectory(zeros(t, ns,nl,nt))
end


Base.getindex(t::Trajectory{N}, a::Any, b::Any, c::Any) where {N <: AbstractMeasurement} = Base.getindex(t.tensor, a,b,c)
obstype(t::Trajectory{N}) where {N <: AbstractMeasurement} = N
Base.show(io::IO, t::Trajectory) = Base.show(io, "Trajectory with $(obstype(t)) data.")

function Trajectory(t::Type{T}, ntimesteps::Int, ves::VirtualEcosystem) where {T <: AbstractMeasurement}
    ns = numspecies(ves)
    nl = numlocations(ves)

    return Trajectory(t, ns,nl,ntimesteps)
end

struct TrajectoryBundle
    trajectories::Vector{Trajectory}
end


function TrajectoryBundle(ves, ntimesteps)
    meas = measurements(ves)
    trajs = []

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

numlocations(t::Trajectory) = length(locations(t))
numspecies(t::Trajectory) = length(species(t))
numtimes(t::Trajectory) = length(times(t))

numlocations(t::TrajectoryBundle) = numlocations(t[1])
numspecies(t::TrajectoryBundle) = numspecies(t[1])
numtimes(t::TrajectoryBundle) = numtimes(t[1])



struct State{MT <: AbstractMeasurement} <: AbstractState
    ptr::Array{MT}
end 

struct StateBundle
    states::Vector{State}
end

trajectories(t::TrajectoryBundle) = t.trajectories
Base.getindex(t::TrajectoryBundle, i::Int) = (trajectories(t))[i]


timestep(traj::Trajectory, time::Int) = times(traj)[:,:,time]
timestep(traj::TrajectoryBundle, time::Int64) = StateBundle([State(timestep(tr, time)) for tr in trajectories(traj)])
