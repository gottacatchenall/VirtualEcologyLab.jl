module VirtualEcologyLab
    #using EcoSISTEM
    using Distributions: Distribution, Uniform, Exponential, Normal

    export generate 
    export simulate

    include("abstracttypes.jl")



    include("mechanisms/dispersal/_dispersal.jl")
    include("mechanisms/drift/_drift.jl")
    include("mechanisms/selection/_selection.jl")
    include("mechanisms/mutation/_mutation.jl")
    include("mechanisms/speciation/_speciation.jl")

    include("observers/abundance_observers.jl")
    include("observers/occupancy_observers.jl")
    include("observers/trait_observers.jl")

    include("landscapes/landscape.jl")
    include("landscapes/locations.jl")
    include("landscapes/environment.jl")

    include("metawebs/metaweb.jl")

    include("dynamics/simulate.jl")
    include("dynamics/trajectory.jl")

end # module

