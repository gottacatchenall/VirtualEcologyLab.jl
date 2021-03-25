module VirtualEcologicalLaboratory

    export AbstractDynamicsModel
    export AbstractDispersalModel, AbstractSelectionModel, AbstractDriftModel

    export AbstractObservationType
    export Abundance, Occupancy, Trait

    export AbstractObserver

    export BrownianMotion
    export DiffusionDispersal
    export DensityDependentSelection

    export Trajectory

    include("abstracttypes.jl")

    include("interfaces/combinemodels.jl")

    include("models/dispersal/diffusion.jl")
    include("models/drift/brownian_motion.jl")
    include("models/selection/density_dependent.jl")

    include("observers/abundance_observers.jl")
    include("observers/occupancy_observers.jl")
    include("observers/trait_observers.jl")


    include("dynamics/simulate.jl")
    include("dynamics/trajectory.jl")


end # module




