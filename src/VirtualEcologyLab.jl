module VirtualEcologyLab
    using Distributions: Distribution, Bernoulli, Uniform, Exponential, Normal


    include("abstracttypes.jl")
    include("dynamics/virtualecosystem.jl")
    export VirtualEcosystem

    include("dynamics/trajectory.jl")
    export Trajectory, AbstractTrajectory

    include("dynamics/simulate.jl")
    export iterateover!
    
    export generate 
    export simulate, simulate!
end # module


