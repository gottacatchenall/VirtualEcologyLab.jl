module VirtualEcologyLab
    #using EcoSISTEM
    using Distributions: Distribution, Bernoulli, Uniform, Exponential, Normal


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
    export occupied, unoccupied

    export DiscreteTrait, ContinuousTrait

    include("species/speciespool.jl")
    include("species/metaweb.jl")

    export AbstractMetaweb 
    export Species, SpeciesPool, DiscreteSpeciesPool, DiscreteSepeciesPoolKpartite, ContinuousSpeciesPool, ContinuousSpeciesPoolKpartite

    include("mechanisms/combinemechanisms.jl")


    include("dynamics/virtualecosystem.jl")
    export VirtualEcosystem

    include("dynamics/trajectory.jl")
    export Trajectory, TrajectoryBundle, AbstractTrajectory
    export SingletonState, MetapopulationState, CommunityState, MetacommunityState

    include("mechanisms/dispersal/_dispersal.jl")
    include("mechanisms/dispersal/Diffusion.jl")
    include("mechanisms/dispersal/IncidenceFunctionColonization.jl")
    include("mechanisms/dispersal/RandomColonization.jl")
    export RandomColonization, IncidenceFunctionColonization

    include("mechanisms/drift/_drift.jl")
    include("mechanisms/drift/RandomExtinction.jl")
    export RandomExtinction

    include("mechanisms/selection/_selection.jl")
    include("mechanisms/mutation/_mutation.jl")
    include("mechanisms/speciation/_speciation.jl")

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

    include("summarystats/mean.jl")
    export SummaryStat
    export mean

    export Time 
    
    export generate 
    export simulate, simulate!, simulate_timestep!, simulate_trajectory, simulate_trajectory!
    export set!
end # module


