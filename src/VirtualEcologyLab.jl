module VirtualEcologyLab
    using Distributions: Distribution, Bernoulli, Uniform, Exponential, Normal
    using DynamicGrids: Rule, Ruleset, rules
    using DataFrames

    include("types.jl")
    include("treatments.jl")    
    export treatments, buildmodels
    include("interfaces/DGinterface.jl")
    export parameters

    export generate 
    export simulate, simulate!
end # module


