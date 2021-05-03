# VirtualEcologyLab.jl

Many ecological and evolutionary processes take place on spatial and temporal scales that we can not directly observe. 
In order to understand the mechanisms that produce the biodiversity we observe on Earth, we need a framework for running
ecological simulations that acts as a "virtual laboratory" (Grimm & Railsback 2005). 

VEL.jl implements a system for modeling ecosystems
based on five fundemental mechanisms (derived from  [Vellend 2010](todo) and the established "big 4" from the modern synthesis from evolutionary genetics).

The mechanisms are 
1. Selection
2. Drift
3. Dispersal
4. Mutation
5. Speciation

These mechanisms can operate on different types of measurements Each of the five mechanisms can act on the following types of information ecologists collect about that ecologists use to describe ecoevolutionary systems.

- Biomass (represented as a `Float64`)
- Abundance (an `Int`)
- Occupancy (a `Bool`)
- Continuous trait (a `Float64`)
- Discrete trait (a set of `symbols` that form a dictionary)

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

It would noet be difficult to extend this to allow the mass of each species to change over time due to `Mutation`, both effecting the functional response dynamics, and eventually leading to `Speciation` if the distribution of masses for a single species splits. 



---
[old]
The core types and functionality of the planned `v0.1` release:

- `AbstractLandscape`: a `LocationSet` in space with corresponding `AbstractEnvironmentalObservations`, with interfaces to `SpatialEcology.jl` etc.
- `AbstractMetaweb`: a network which describes how a species pool interacts (using generative models from `EcologicalNetworks.jl`.
- An `AbstractDynamicsModel` model is composed of AbstractDispersalModel + AbstractSelectionModel + AbstractDriftModel.
- Running `simulate(dynamicsmodel)` where `dynamicsmodel` is of the type `AbstractDynamicsModel` creates a `MetacommunityTrajectory{MT}` (where MT is a corresponding measurement type for `dynamcismodel`; at the moment: Occupancy, Abundance, or Trait)
- Simulates `Observer`s with given patterns of observation (frequency, location) and `ObserverError`.
