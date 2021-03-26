struct Trajectory{OT <: AbstractObservationType}
    tensor::Array{OT, 3}
end

Base.getindex(t::Trajectory{N}, a::Any, b::Any, c::Any) where {N <: AbstractObservationType} = Base.getindex(t.tensor, a,b,c)
obstype(t::Trajectory{N}) where {N <: AbstractObservationType} = N

species(t::Trajectory) = t[1:length(t[:,1,1]), :, :]
locations(t::Trajectory) = t[:,1:length(t[1,:,1]), :]
times(t::Trajectory) = t[:,:,1:length(t[1,1,:])]


Base.show(io::IO, t::Trajectory) = begin 
    typ = obstype(t)
    Base.show(io, "Trajectory with $typ data.")
end

