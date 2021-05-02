# VirtualEcologyLab.jl

Many ecological and evolutionary processes take place on spatial and temporal scales that we can not directly observe. 
In order to understand the mechanisms that produce the biodiversity we observe on Earth, we need a framework for running
ecological simulations that acts as a "virtual laboratory" (Grimm & Railsback 2005). 

VEL.jl implements a system for modeling ecosystems
based on five fundemental mechanisms (derived from  [Vellend 2010](todo) and the established "big 4" from the modern synthesis from evolutionary genetics).

The mechanisms are 
1. Selection
2. Drift
3. Dispersa
4. Mutation
5. Speciation

These mechanisms can operate on different types of measurements Each of the five mechanisms can act on the following types of information ecologists collect about that ecologists use to describe ecoevolutionary systems.

- Biomass (represented as a `Float64`)
- Abundance (an `Int`)
- Occupancy (a `Bool`)
- Continuous trait (a `Float64`)
- Discrete trait (a set of `symbols` that form a dictionary)


## Example: 

In this short example we create a system of `Occupancy` dynamics that follows Hanski 1994's incidence-function model. We do this by combining a `Drift` model (`RandomExtinction`) with a `Dispersal` model `IncidenceFunctionColonization`. 

```
using VirtualEcologyLab
using Distributions: Exponential

numpopulations = 30
meanarea = 3

populations = generate(PoissonProcess, numpopulations) 
areas = generate(StaticEnvironmentalVariable, populations, Exponential(meanarea))

landscape = Landscape(populations, [areas])
metaweb = SingleSpecies()

model = (landscape) -> IncidenceFunctionColonization(0.3, areas) + RandomExtinction(0.1)

traj = Trajectory(Occupancy, metaweb, landscape)
simulate!(model, metaweb, landscape, traj)
```





---
[old]
The core types and functionality of the planned `v0.1` release:

- `AbstractLandscape`: a `LocationSet` in space with corresponding `AbstractEnvironmentalObservations`, with interfaces to `SpatialEcology.jl` etc.
- `AbstractMetaweb`: a network which describes how a species pool interacts (using generative models from `EcologicalNetworks.jl`.
- An `AbstractDynamicsModel` model is composed of AbstractDispersalModel + AbstractSelectionModel + AbstractDriftModel.
- Running `simulate(dynamicsmodel)` where `dynamicsmodel` is of the type `AbstractDynamicsModel` creates a `MetacommunityTrajectory{MT}` (where MT is a corresponding measurement type for `dynamcismodel`; at the moment: Occupancy, Abundance, or Trait)
- Simulates `Observer`s with given patterns of observation (frequency, location) and `ObserverError`.
