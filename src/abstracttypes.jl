
"""

    Measurements
"""

"""
    AbstractMeasurement

   The abstract supertype for all types of measurements.
"""
abstract type AbstractMeasurement end

"""
    AbstractBiomassMeasurement <: AbstractMeasurement

    Abstract supertype for all measurements that describe the occurence of 
    species at a particular Location and time.
"""
abstract type AbstractBiomassMeasurement <: AbstractMeasurement end

"""
    AbstractTraitMeasurements

    The abstract supertype for all trait measurements. 
"""
abstract type AbstractTraitMeasurement <: AbstractMeasurement end

"""
    AbstractEnvironmentalMeasurement
"""
abstract type AbstractEnvironmentMeasurement <: AbstractMeasurement  end




# Declare the new type.
primitive type Occupancy <: Integer 8 end
Occupancy(x::Int) = reinterpret(Occupancy, Int8(x))
Int(x::Occupancy) = reinterpret(Int8, x)
Occupancy(x::Bool) = reinterpret(Occupancy, Int8(x))


set!(x::Occupancy, v) = begin
    x=v
end

primitive type Abundance <: Integer 32 end # does matching this with the architecture word size help?
primitive type Biomass <: AbstractFloat 64 end 



"""

    Mechanisms
"""

"""
    AbstractMechanism

    The abstract supertype for all mechanisms.
"""
abstract type AbstractMechanism end
abstract type AbstractGlobalMechanism <: AbstractMechanism end
abstract type AbstractLocalMechanism <: AbstractMechanism end 

"""
    AbstractDriftModel{T <: AbstractMeasurement} <: AbstractLocalMechanism

    Abstract supertype for all drift models
"""
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

struct SummaryStat <: Function end

struct Time <: AbstractMeasurement end 