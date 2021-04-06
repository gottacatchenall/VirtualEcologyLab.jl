abstract type AbstractDynamicsModel end
abstract type AbstractDispersalModel <: AbstractDynamicsModel end
abstract type AbstractSelectionModel <: AbstractDynamicsModel end
abstract type AbstractDriftModel <: AbstractDynamicsModel end

abstract type AbstractObserver end 
abstract type AbstractObservationType end


abstract type AbstractLandscape end 
abstract type AbstractLocationSet end 
abstract type AbstractLocationSetGenerator end
abstract type AbstractEnvironmentalVariable end
abstract type AbstractEnvironmentalObservationGenerator end 

abstract type AbstractState end
abstract type AbstractTrajectory end

abstract type AbstractMetaweb end