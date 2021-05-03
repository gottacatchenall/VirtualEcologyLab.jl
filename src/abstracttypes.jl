"""

    Mechanisms
"""
abstract type AbstractMechanism end
abstract type AbstractGlobalMechanism <: AbstractMechanism end
abstract type AbstractLocalMechanism <: AbstractMechanism end 

abstract type AbstractDriftModel <: AbstractLocalMechanism end
abstract type AbstractSpeciationModel <: AbstractGlobalMechanism end
abstract type AbstractDispersalModel <: AbstractGlobalMechanism end
abstract type AbstractMutationModel <: AbstractLocalMechanism end

abstract type AbstractSelectionModel <: AbstractLocalMechanism end
abstract type AbstractBioticSelectionModel <: AbstractSelectionModel end
abstract type AbstractAbioticSelectionModel <: AbstractSelectionModel end


"""

    Measurements
"""
abstract type AbstractMeasurement end

abstract type AbstractBiomassMeasurement <: AbstractMeasurement end
abstract type AbstractTraitMeasurement <: AbstractMeasurement end
abstract type AbstractEnvironmentMeasurement <: AbstractMeasurement  end


struct Occupancy <: AbstractBiomassMeasurement 
    state::Bool
end 

struct Abundance <: AbstractBiomassMeasurement 
    state::Int64
end 

struct Biomass <: AbstractBiomassMeasurement 
    state::Float64
end 
Base.zero(::Type{Biomass}) = Biomass(0.)
Base.zero(::Type{Occupancy}) = Occupancy(0)
Base.zero(::Type{Abundance}) = Abundance(0)


struct DiscreteTrait <: AbstractTraitMeasurement
    val::Int64
    labels::Vector{String}
end
Base.zero(::Type{DiscreteTrait}) = DiscreteTrait(0, ["A"])

struct ContinuousTrait <: AbstractTraitMeasurement
    val::Float64
end
Base.zero(::Type{ContinuousTrait}) = ContinuousTrait(0.)


"""

    States
"""
abstract type AbstractState end
struct SingletonState{T <: AbstractMeasurement} <: AbstractState
    state::T
end

struct MetapopulationState{T <: AbstractMeasurement} <: AbstractState
    state::Vector{T}
end

struct MetacommunityState{T <: AbstractMeasurement} <: AbstractState
    state::Matrix{T}
end 

abstract type AbstractTrajectory end



"""

    Landscapes
"""
abstract type AbstractLandscape end 
abstract type AbstractLocationSet end 
abstract type AbstractLocationSetGenerator end
abstract type AbstractEnvironmentalVariable end
abstract type AbstractEnvironmentalObservationGenerator end 


"""
    Metawebs
"""
abstract type AbstractMetaweb end


"""
    VirtualEcosystem
"""

struct VirtualEcosystem
end