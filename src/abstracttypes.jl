
"""

    Measurements
"""
abstract type AbstractMeasurement end

abstract type AbstractBiomassMeasurement <: AbstractMeasurement end
abstract type AbstractTraitMeasurement <: AbstractMeasurement end
abstract type AbstractEnvironmentMeasurement <: AbstractMeasurement  end


struct Occupancy <: AbstractBiomassMeasurement 
    value::Bool
end 
Base.zero(::Type{Occupancy}) = Occupancy(false)

struct Abundance <: AbstractBiomassMeasurement 
    value::Abundance
end 
Base.zero(::Type{Abundance}) = Abundance(0)

struct Biomass <: AbstractBiomassMeasurement 
    value::Float64
end 
Base.zero(::Type{Biomass}) = Biomass(0.)



"""

    Mechanisms
"""
abstract type AbstractMechanism end
abstract type AbstractGlobalMechanism <: AbstractMechanism end
abstract type AbstractLocalMechanism <: AbstractMechanism end 

abstract type AbstractDriftModel{T} <: AbstractLocalMechanism end
abstract type AbstractSpeciationModel{T} <: AbstractGlobalMechanism end
abstract type AbstractDispersalModel{T} <: AbstractGlobalMechanism end
abstract type AbstractMutationModel{T} <: AbstractLocalMechanism end

abstract type AbstractSelectionModel{T} <: AbstractLocalMechanism end
abstract type AbstractBioticSelectionModel{T} <: AbstractSelectionModel{T} end
abstract type AbstractAbioticSelectionModel{T} <: AbstractSelectionModel{T} end


struct DiscreteTrait <: AbstractTraitMeasurement
    val::Int64
    labels::Vector{String}
end
Base.zero(::Type{DiscreteTrait}) = DiscreteTrait(0, ["A"])

struct ContinuousTrait <: AbstractTraitMeasurement
    val::Float64
end
Base.zero(::Type{ContinuousTrait}) = ContinuousTrait(0.)


struct MechanismAssemblage
    mechanisms::Vector{AbstractMechanism}
end 





"""

    Landscapes
"""

abstract type AbstractLandscape end 
abstract type AbstractLocationSet end 
abstract type AbstractLocationSetGenerator end
abstract type AbstractEnvironmentalVariable end
abstract type AbstractEnvironmentalObservationGenerator end 
struct Location
    coordinate::Vector{Float64}
end
    
struct LocationSet <: AbstractLocationSet
    locations::Vector{Location}
end


"""
    Metawebs
"""
abstract type AbstractMetaweb end

abstract type  AbstractSpecies end 

struct Species <: AbstractSpecies end 

abstract type AbstractSpeciesPool end


"""

    States
"""
abstract type AbstractState end
struct SingletonState{T <: AbstractMeasurement} <: AbstractState
    state::T
    species::Species
    location::Location
end

struct MetapopulationState{T <: AbstractMeasurement} <: AbstractState
    state::Vector{T}
    location::Vector{Location}
end

struct CommunityState{T <: AbstractMeasurement} <: AbstractState
    state::Vector{T}
    species::Vector{Species}
end

struct MetacommunityState{T <: AbstractMeasurement} <: AbstractState
    state::Matrix{T}
end 

abstract type AbstractStateBundle end # set of multiple states (i.e. biomass and a trait value), which are used together for a given model 
abstract type AbstractTrajectoryBundle end
abstract type AbstractTrajectory end


