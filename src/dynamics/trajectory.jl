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

struct TrajectoryAssemblage{OT <: AbstractMeasurement}
    trajectories::Vector{Trajectory{OT}}
end


function TrajectoryAssemblage(ves, ntimesteps)
    meas = measurements(ves)
    trajs = []

    for m in meas 
        traj = Trajectory(m, ntimesteps, ves)
        push!(trajs, traj)
    end
    return TrajectoryAssemblage(trajs)
end

# nothing to see here...
species(t::Trajectory) = t[1:length(t[:,1,1]), :, :]
locations(t::Trajectory) = t[:,1:length(t[1,:,1]), :]
times(t::Trajectory) = t[:,:,1:length(t[1,1,:])]

