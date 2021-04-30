module VirtualEcologicalLaboratory
    using EcoSISTEM
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
    export AbstractLocationSet
    export Landscape
    export Location, LocationSet, LocationSetGenerator 
    export PoissonProcess
    
    export AbstractEnvironmentalVariable
    export StaticEnvironmentalVariable, EnvironmentalObservation


    export generate 
    export simulate

    include("abstracttypes.jl")

    include("interfaces/combinemodels.jl")

    include("metawebs/metaweb.jl")

    include("mechanisms/dispersal/colonization.jl")
    include("mechanisms/dispersal/movement.jl")

    include("mechanisms/drift/brownian_motion.jl")
    include("mechanisms/drift/extinction.jl")

    include("mechanisms/selection/density_dependent.jl")
    include("mechanisms/selection/directional.jl")
    include("mechanisms/selection/disruptive.jl")

    include("observers/abundance_observers.jl")
    include("observers/occupancy_observers.jl")
    include("observers/trait_observers.jl")

    include("landscapes/landscape.jl")
    include("landscapes/locations.jl")
    include("landscapes/environment.jl")


    include("dynamics/simulate.jl")
    include("dynamics/trajectory.jl")


end # module

