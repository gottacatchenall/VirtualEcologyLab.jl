module VirtualEcologicalLaboratory

    using Distributions: Distribution, Uniform, Exponential, Normal

    export AbstractDynamicsModel

    export AbstractDispersalModel
    export DiffusionDispersal, StochasticColonization

    export AbstractSelectionModel
    export DensityDependentSelection

    export AbstractDriftModel
    export BrownianMotion, StochasticExtinction

    export Trajectory

    export AbstractMetaweb
    export SingleSpecies, NicheModel

    export AbstractObservationType
    export Abundance, Occupancy, Trait 
    export AbstractObserver

    export AbstractLandscape
    export Location, LocationSet, LocationSetGenerator 
    export PoissonProcess
    
    export AbstractEnvironmentalVariable
    export StaticEnvironmentalVariable, EnvironmentalObservation

    export generate 
    export simulate

    include("abstracttypes.jl")

    include("interfaces/combinemodels.jl")

    include("metawebs/metaweb.jl")

    include("models/dispersal/diffusion.jl")
    include("models/dispersal/colonization.jl")

    include("models/drift/brownian_motion.jl")
    include("models/drift/extinction.jl")

    include("models/selection/density_dependent.jl")

    include("observers/abundance_observers.jl")
    include("observers/occupancy_observers.jl")
    include("observers/trait_observers.jl")

    include("landscapes/landscape.jl")
    include("landscapes/environment.jl")


    include("dynamics/simulate.jl")
    include("dynamics/trajectory.jl")


end # module

