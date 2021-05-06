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

    include("species/speciespool.jl")
    include("species/metaweb.jl")

    export AbstractMetaweb 
    export Species, SpeciesPool, DiscreteSpeciesPool, DiscreteSepeciesPoolKpartite, ContinuousSpeciesPool, ContinuousSpeciesPoolKpartite

    include("mechanisms/combinemechanisms.jl")
    

    include("dynamics/state.jl")
    export State, StateBundle, AbstractState, AbstractStateBundle
    export states

    include("dynamics/virtualecosystem.jl")
    export VirtualEcosystem

    include("dynamics/trajectory.jl")
    export Trajectory, TrajectoryBundle, AbstractTrajectory
    export SingletonState, MetapopulationState, CommunityState, MetacommunityState

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

    export measurement, measurements


    include("dynamics/simulate.jl")
    export iterateover!

    export StochasticColonization 

    export species, locations, times
    export numspecies, numlocations, numtimes

    export timestep

    export generate 
    export simulate, simulate!, simulate_timestep!, simulate_trajectory, simulate_trajectory!

end # module


