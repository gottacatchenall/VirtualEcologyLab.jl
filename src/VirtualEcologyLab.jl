module VirtualEcologyLab
    #using EcoSISTEM
    using Distributions: Distribution, Uniform, Exponential, Normal


    include("abstracttypes.jl")

    export AbstractMechanism, AbstractLocalMechanism, AbstractGlobalMechanism
    export AbstractDriftModel, AbstractSpeciationModel, AbstractDispersalModel, AbstractMutationModel
    export AbstractSelectionModel, AbstractAbioticSelectionModel, AbstractBioticSelectionModel

    export MechanismAssemblage

    export AbstractLandscape, AbstractLocationSet, AbstractLocationSetGenerator
    export Location

    export AbstractMechanism 
    export AbstractBiomassMeasurement, AbstractTraitMeasurement, AbstractEnvironmentalVariable

    export Occupancy, Abundance, Biomass
    export DiscreteTrait, ContinuousTrait

    export AbstractMetaweb 
    export Species, SpeciesPool

    export AbstractState, AbstractStateBundle, AbstractTrajectory
    export SingletonState, MetapopulationState, CommunityState, MetacommunityState

    include("mechanisms/combinemechanisms.jl")

    include("mechanisms/dispersal/_dispersal.jl")
    include("mechanisms/dispersal/occupancy.jl")


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


    export PoissonProcess

    include("species/metaweb.jl")
    export SpeciesList

    include("dynamics/virtualecosystem.jl")
    export VirtualEcosystem
    export measurements

    include("dynamics/trajectory.jl")
    export Trajectory, TrajectoryAssemblage

    include("dynamics/simulate.jl")


    export StochasticColonization 

    export species, locations, times
    export numspecies, numlocations, numtimes

    export generate 
    export simulate

end # module


