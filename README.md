# VirtualEcologicalLaboratory.jl

Many ecological and evolutionary processes take place on spatial and temporal scales that we can not directly observe. 
In order to understand the mechanisms that produce the biodiversity we observe on Earth, we need a framework for running
ecological simulations that acts as a "virtual laboratory" (Grimm & Railsback 2005). 

The core types and functionality of the planned `v0.1` release:

- `AbstractLandscape`: a `LocationSet` in space with corresponding `AbstractEnvironmentalObservations`, with interfaces to `SpatialEcology.jl` etc.
- `AbstractMetaweb`: a network which describes how a species pool interacts (using generative models from `EcologicalNetworks.jl`.
- An `AbstractDynamicsModel` model is composed of AbstractDispersalModel + AbstractSelectionModel + AbstractDriftModel.
- Running `simulate(dynamicsmodel)` where `dynamicsmodel` is of the type `AbstractDynamicsModel` creates a `MetacommunityTrajectory{MT}` (where MT is a corresponding measurement type for `dynamcismodel`; at the moment: Occupancy, Abundance, or Trait)
- Simulates `Observer`s with given patterns of observation (frequency, location) and `ObserverError`.
