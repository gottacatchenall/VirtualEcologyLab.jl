# VirtualEcologyLab.jl

[`VirtualEcologyLab.jl`](https://gottacatchenall.github.io/VirtualEcologyLab.jl/dev/)
is a Julia library for creating virtual ecological and evolutionary experiments
that act as a "virtual laboratory" (Grimm & Railsback 2005).  VEL.jl implements
a system for modeling ecosystems based on five fundemental mechanisms:
`Selection`, `Drift`, `Dispersal`, `Mutation`, and `Speciation`. These
mechanisms can operate on different types of measurements (`Biomass`,
`Abundance`, `Occupancy`, `ContinuousTrait`, `DiscreteTrait`), and be combined
to create arbitrarily complex systems of ecological and evolutionary dynamics
using few lines of code (see [the example](#example))

`VEL.jl` is part of [EcoJulia](https://github.com/EcoJulia), and has interfaces
to other packages in the EcoJulia ecosystem (EcologicalNetworks.jl,
SpatialEcology.jl, Diversity.jl) and uses
[`EcoSISTEM.jl`](https://github.com/boydorr/EcoSISTEM.jl) as a simulation engine
for scalable parallelized simulation.

`VEL.jl` is currently in alpha and will have a tagged `v0.1` release when fully
functional.

# Primer

This is a quick primer on how the software is designed.

## Measurements

A **measurement** is information about an ecological or evolutionary system that
can be written down. Within `VEL`, measurements are split into two types:
`Biotic` and `Abiotic`.

`Biotic` measurements correspond to things measuremed about living things. At
the moment, the types of `Biotic` measurements are:

- `Biomass` (represented as a `Float64`)
- `Abundance` (an `Int`)
- `Occupancy` (a `Bool`)
- `ContinuousTrait` (a `Float64`)
- `DiscreteTrait` (a set of `symbols` that form a dictionary)

`Abiotic` measurements correspond to the environmental conditions at a
particular location. The two broad categories of `Abiotic` measurements are
`StaticEnvironmentalMeasurement`, which is fixed in time, and
`DynamicEnvironmentalMeasurement`, which can change over time.

## States

A **state** is set of **measurements** that describes an ecological system.

- `SingletonState`: A measurement corresponding to a single species at a single location and time. (For 1D measurements, a scalar)
- `MetapopulationState`: A measurement corresponding to a single species across spatial locations. (For
  1D measurements, a vector)
- `CommunityState`: A measurement corresponding to a set of species in one location (For 1D measurements, a vector)
- `MetacommunityState`: A measurement corresponding to a set of species across spatial locations (For 1D measurements, a
  matrix)

States of different types of measurements can be grouped to create
`StateAssemblage`. For example, this is necessesary to build a
mechanism that effects the `Abundance` of species changes as a function of some species`Trait`.

## Mechanisms

Models in `VEL` are built by comining **mechanisms**. A **mechanism** describes
how a **state** of a system  changes from one time-step to the next.

Within `VEL`, mechanisms are divided in to **5** categories  (derived from
[Vellend 2010](http://www.dx.doi.org/10.1086/652373) and the established "big 4"
from the from evolutionary genetics): selection, drift, dispersal, mutation,
speciation.

### Types of mechanisms

#### `Selection`

**Selection** describes a mechanism that alters a `BioticMeausrement` as a
*function of an `AbioticMeasurement` (in `AbioticSelection` mechanisms), or a
*mechanism that alters a `BioticMeasurement` as a function of another
*`BioticMeasurement` (in `BioticSelection`).

#### `Drift`

**Drift** describes a mechanism that alters a `BioticMeasurement`
*stochastically.

#### `Dispersal`

**Dispersal** describes a mechanism that alters a `BioticMeasurement` across
*multiple locations. Depending on the measurement the "conservation of mass"
*rule is different.   

#### `Mutation`

**Mutation** specifically relates to `Trait` measurements locally

#### `Speciation`

**Speciation** specifically relates to `Trait` measurements across space.


### Defining mechanisms and dispatch

The form in which any individual `::AbstractMechanism` acts on a `State` is via
dispatch on

`simulate!(mech::AbstractMechanism, oldstate::State, newstate::State)`


It is unique in its dispatch patterns because it involves changing the metaweb, and recomputing parameters used in other mechanisms because of this.


### Combining mechanisms

Only models corresponding to the same measurement type can be combined to create
a `ModelAssemablage`, however multiple `ModelAssemblage`s corresponding to
different measurements can be combined into a single simulation.  

## Trajectories

A trajectory (or trajectory assemblage) is a set of states.

## Observers

VEL enables creating observers which sample from the virtual system across given
spatial and temporal patterns, and which can simulate observation error.  

# Example:

In this short example we simlate the `Biomass` dynamics of a food-web with a
`Selection` in the form of allometric scaling functional response. We create a
landscape with 30 locations with `Dispersal` between them, with dispersal
distance also scaling with allometry. We then add a `Drift` model of local
demographic stochasticity in the form of density dependent Brownian motion (i.e.
the $\sigma$ of the noise process is scaled by the biomass at that location and
time). This highlights that even a model with 3 moderately complex components
can be built with 10-15 lines of code using `VEL.jl`.  

``` using VirtualEcologicalLaboratory using Distributions: Exponential

using EcologicalNetworks: nichemodel, trophiclevels

# set up species numspecies = 30 meanconnectance = 0.15 metaweb = nichemodel(30,
# 0.15) trophiclevs = trophiclevels(metaweb) masses =
# [generate(StaticSpeciesTrait, s, 10.^(trophiclevs[s])) for s in
# species(metaweb) ]

# setup locations numpopulations = 50 populations = generate(PoissonProcess,
# numpopulations)

# setup model  model = Eating(functional_response=YodzisInnes(masses)) +   #
# density dependent biotic selection
# DiffusionDispersal(ibd=AllometricIBD(masses)) +     # allometric scaling
# dispersa distance DensityDependentBrownianMotion(0.3)                 #
# density dependent drift

# memory allocation  ntimesteps = 500 traj = Trajectory(Biomass, metaweb,
# landscape, ntimesteps)

simulate!(model, metaweb, landscape, traj)

```

Within the toolkit, it would not be exceedingly difficult to extend this model
to allow the mass of each species to evolve over time due to `Mutation`,
`Selection` or `Drift`, both effecting the functional response dynamics, and
eventually leading to `Speciation` if the distribution of masses for a single
species splits.
