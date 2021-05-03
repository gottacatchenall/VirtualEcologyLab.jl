# VirtualEcologyLab.jl

Many ecological and evolutionary processes take place on spatial and temporal scales that we can not directly observe. 
In order to understand the mechanisms that produce the biodiversity we observe on Earth, we need a framework for running
ecological simulations that acts as a "virtual laboratory" (Grimm & Railsback 2005). 

VEL.jl implements a system for modeling ecosystems
based on five fundemental mechanisms (derived from  [Vellend 2010](todo) and the established "big 4" from the modern synthesis from evolutionary genetics).

The mechanisms are 
`Selection`, `Drift`, `Dispersal`, `Mutation`, `Speciation`

These mechanisms can operate on different types of measurements Each of the five mechanisms can act on the following types of information ecologists collect about that ecologists use to describe ecoevolutionary systems.

Further, these mechanisms can change as a function of other non-biotic observations, included in the types `StaticEnvironmentMeasurement` and `DynamicEnvironmentMeasurement`.


From this, arbitrarily complex models can 
be composed and run using short amounts 
of code. 


## Example: 

In this short example we simlate the `Biomass` dynamics of a food-web with a `Selection` in the form of allometric scaling functional response. We create a landscape with 30 locations with `Dispersal` between them, with dispersal distance also scaling with allometry. We then add a `Drift` model of local demographic stochasticity in the form of density dependent Brownian motion (i.e. the $\sigma$ of the noise process is scaled by the biomass at that location and time). This highlights that even a model with 3 moderately complex components can be built with 10-15 lines of code using `VEL.jl`.  



```
using VirtualEcologicalLaboratory
using Distributions: Exponential

using EcologicalNetworks: nichemodel, trophiclevels

# set up species
numspecies = 30
meanconnectance = 0.15
metaweb = nichemodel(0.15)
trophiclevs = trophiclevels(metaweb)
masses = [generate(StaticSpeciesTrait, s, 10^(trophiclevs[s])) for s in species(metaweb) ] 

# setup locations
numpopulations = 50
populations = generate(PoissonProcess, numpopulations) 

# setup model 
model = Eating(functional_response=YodzisInnes(masses)) +   # density dependent biotic selection
        DiffusionDispersal(ibd=AllometricIBD(masses)) +     # allometric scaling dispersa distance
        DensityDependentBrownianMotion(0.3)                 # density dependent drift 

# memory allocation 
ntimesteps = 500
traj = Trajectory(Biomass, metaweb, landscape, ntimesteps)

simulate!(model, metaweb, landscape, traj)

```

Within the toolkit, it would not be exceedingly difficult to extend this
model to allow the mass of each species to evolve over time due to `Mutation`, `Selection` or `Drift`, both effecting the functional response dynamics, and eventually leading to `Speciation` if the distribution of masses for a single species splits. 


## Primer 

This is a quick primer on how the software is designed.

### Measurements

A **measurement** is information about an ecological or evolutionary system that can be written down. Within `VEL`, measurements are split
into two types: `Biotic` and `Abiotic`. 

`Biotic` measurements correspond to things measuremed about living things. At the moment, the types of `Biotic` measurements are: 

- `Biomass` (represented as a `Float64`)
- `Abundance` (an `Int`)
- `Occupancy` (a `Bool`)
- `ContinuousTrait` (a `Float64`)
- `DiscreteTrait` (a set of `symbols` that form a dictionary)

`Abiotic` measurements correspond to the environmental conditions at a particular location. The two broad categories of `Abiotic` measurements are `StaticEnvironmentalMeasurement`, which is fixed in time, and `DynamicEnvironmentalMeasurement`, which can change over time. 

### States

A **state** is set of **measurements** that describes an ecological
system.

- `SingletonState`: A measurement corresponding to a single species at a single location and time. (For 1D measurements, a scalar)
- `MetapopulationState`: A measurement corresponding to a single species across spatial locations. (For 1D measurements, a vector)
- `MetacommunityState`: (For 1D measurements, a matrix)

States of different types of measurements can be combined to create
`StateAssemblage`, which is necessesary if for exampleone wanted to build a model where the `Abundance` of species changes as a function of some species `Trait`.


### Mechanisms

Models in `VEL` are built by comining **mechanisms**.
A **mechanism** describes how a **state** of a system 
changes from one time-step to the next. 

Within `VEL`, mechanisms are divided in to **5** categories 
(derived from  [Vellend 2010](todo) and the established "big 4" from the from evolutionary genetics):

- `Selection` 
- `Drift`
- `Dispersal`
- `Mutation` 
- `Speciation`

Only models corresponding to the same measurement type can be combined to create a `ModelAssemablage`,
however multiple `ModelAssemblage`s corresponding to different measurements can be combined into a single simulation.  


### Trajectories

A trajectory (or trajectory assemblage) is a set of states.

### Observers

VEL enables creating observers which sample from the virtual system
across given spatial and temporal patterns, and which can simulate observation error.  

---


---
[old]
The core types and functionality of the planned `v0.1` release:

- `AbstractLandscape`: a `LocationSet` in space with corresponding `AbstractEnvironmentalObservations`, with interfaces to `SpatialEcology.jl` etc.
- `AbstractMetaweb`: a network which describes how a species pool interacts (using generative models from `EcologicalNetworks.jl`.
- An `AbstractDynamicsModel` model is composed of AbstractDispersalModel + AbstractSelectionModel + AbstractDriftModel.
- Running `simulate(dynamicsmodel)` where `dynamicsmodel` is of the type `AbstractDynamicsModel` creates a `MetacommunityTrajectory{MT}` (where MT is a corresponding measurement type for `dynamcismodel`; at the moment: Occupancy, Abundance, or Trait)
- Simulates `Observer`s with given patterns of observation (frequency, location) and `ObserverError`.
