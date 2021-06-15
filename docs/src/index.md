# VirtualEcologyLab.jl

[`VirtualEcologyLab.jl`](https://gottacatchenall.github.io/VirtualEcologyLab.jl/dev/)
is a Julia library for simulating ecological and evolutionary experiments.

`VEL.jl` aims to create a "virtual laboratory" (Grimm & Railsback 2005) for setting up, running,
and managing ecological simulations. 

The major goals of the library:
- interface with generic simulation models using the `parameters` function
- define `Treatment`s which contain ranges and combinations of parameter values, and random seed values for replication 
- deploy `Treatment`s to generic number of cores/threads/architectures 
- ability to cache data from simulations 
- combine data from simulations and apply abstract summary statistics to it  
 of parameters

Minor details:
- Parameters can be numbers, or distributions
do you draw from the distribution every time the parameter is invoked, or once per replicate? Once per replicate is going to be much easier to deploy
to GPU/etc where rand() isn't callable.  