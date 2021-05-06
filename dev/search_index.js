var documenterSearchIndex = {"docs":
[{"location":"interfaces/types/#Types","page":"Types","title":"Types","text":"","category":"section"},{"location":"interfaces/types/#Measurements","page":"Types","title":"Measurements","text":"","category":"section"},{"location":"interfaces/types/","page":"Types","title":"Types","text":"Biomass (represented as a Float64)\nAbundance (an Int)\nOccupancy (a Bool)\nContinuousTrait (a Float64)\nDiscreteTrait (a set of symbols that form a dictionary)","category":"page"},{"location":"interfaces/types/#Mechanisms","page":"Types","title":"Mechanisms","text":"","category":"section"},{"location":"interfaces/types/","page":"Types","title":"Types","text":"AbstractMechanism","category":"page"},{"location":"interfaces/types/#Trajectories-and-TrajectoryBundles","page":"Types","title":"Trajectories and TrajectoryBundles","text":"","category":"section"},{"location":"interfaces/types/#States-and-StateBundles","page":"Types","title":"States and StateBundles","text":"","category":"section"},{"location":"lib/public/#Public-methods-for-the-VEL-api","page":"Public API","title":"Public methods for the VEL api","text":"","category":"section"},{"location":"lib/public/","page":"Public API","title":"Public API","text":"Modules = [VirtualEcologyLab]\nPrivate = false\nPublic = true\nOrder = [:function]","category":"page"},{"location":"lib/public/#VirtualEcologyLab.simulate_timestep!-Tuple{Any,Any,Any}","page":"Public API","title":"VirtualEcologyLab.simulate_timestep!","text":"simulate_timestep!(ves, oldstate, newstate)\n\nthe primary dispatch for mechanisms \n\n\n\n\n\n","category":"method"},{"location":"lib/public/#VirtualEcologyLab.simulate_trajectory!-Tuple{Any,TrajectoryBundle}","page":"Public API","title":"VirtualEcologyLab.simulate_trajectory!","text":"simulate_trajectory!(ves, traj::TrajectoryAssemblage)\n\n\n\n\n\n","category":"method"},{"location":"#VirtualEcologyLab.jl","page":"Index","title":"VirtualEcologyLab.jl","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"VirtualEcologyLab.jl is a Julia library for simulating ecological and evolutionary experiments. VEL.jl aims to create a  \"virtual laboratory\" (Grimm & Railsback 2005) for ecological and evolutionary processes.","category":"page"},{"location":"","page":"Index","title":"Index","text":"VEL.jl composes models based on five mechanisms: Selection, Drift, Dispersal, Mutation, and Speciation. These mechanisms can operate on different types of measurements (Biomass, Abundance, Occupancy, ContinuousTrait, DiscreteTrait), and be combined to create arbitrarily complex systems of ecological and evolutionary dynamics using few lines of code (see the example)","category":"page"},{"location":"","page":"Index","title":"Index","text":"VEL.jl is part of EcoJulia, and has interfaces to other packages in the EcoJulia ecosystem (EcologicalNetworks.jl, SpatialEcology.jl, Diversity.jl) and uses EcoSISTEM.jl as a simulation engine for scalable parallelized simulation.","category":"page"},{"location":"","page":"Index","title":"Index","text":"VEL.jl is currently in alpha and will have a tagged v0.1 release when fully functional.","category":"page"},{"location":"#Primer","page":"Index","title":"Primer","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"This is a quick primer on how the software is designed.","category":"page"},{"location":"#Measurements","page":"Index","title":"Measurements","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"A measurement is information about an ecological or evolutionary system that can be written down. Within VEL, measurements are split into two types: Biotic and Abiotic.","category":"page"},{"location":"","page":"Index","title":"Index","text":"Biotic measurements correspond to things measuremed about living things. At the moment, the types of Biotic measurements are:","category":"page"},{"location":"","page":"Index","title":"Index","text":"Biomass (represented as a Float64)\nAbundance (an Int)\nOccupancy (a Bool)\nContinuousTrait (a Float64)\nDiscreteTrait (a set of symbols that form a dictionary)","category":"page"},{"location":"","page":"Index","title":"Index","text":"Abiotic measurements correspond to the environmental conditions at a particular location. The two broad categories of Abiotic measurements are StaticEnvironmentalMeasurement, which is fixed in time, and DynamicEnvironmentalMeasurement, which can change over time.","category":"page"},{"location":"#States","page":"Index","title":"States","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"A state is set of measurements that describes an ecological system.","category":"page"},{"location":"","page":"Index","title":"Index","text":"SingletonState: A measurement corresponding to a single species at a single location and time. (For 1D measurements, a scalar)\nMetapopulationState: A measurement corresponding to a single species across spatial locations. (For 1D measurements, a vector)\nCommunityState: A measurement corresponding to a set of species in one location (For 1D measurements, a vector)\nMetacommunityState: A measurement corresponding to a set of species across spatial locations (For 1D measurements, a matrix)","category":"page"},{"location":"","page":"Index","title":"Index","text":"States of different types of measurements can be grouped to create StateAssemblage. For example, this is necessesary to build a mechanism that effects the Abundance of species changes as a function of some speciesTrait.","category":"page"},{"location":"#Mechanisms","page":"Index","title":"Mechanisms","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"Models in VEL are built by comining mechanisms. A mechanism describes how a state of a system  changes from one time-step to the next.","category":"page"},{"location":"","page":"Index","title":"Index","text":"Within VEL, mechanisms are divided in to 5 categories  (derived from Vellend 2010 and the established \"big 4\" from the from evolutionary genetics): selection, drift, dispersal, mutation, speciation.","category":"page"},{"location":"#Types-of-mechanisms","page":"Index","title":"Types of mechanisms","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"Selection describes a mechanism that alters a BioticMeasurement. This occurs in two ways: 1) AbioticSelection: where a BioticMeasurement changes as a function of an AbioticMeasurement, or 2) BioticSelection, where a BioticMeasurement changes as a function of another BioticMeasurement.\nDrift describes a mechanism that alters a BioticMeasurement stochastically.\nDispersal describes a mechanism that alters a BioticMeasurement across multiple locations due to individuals of a Species reproducing in a different location than where they were born. Depending on the measurement the \"conservation of mass\" rule is different. Some dispersal models (e.g. Levins/Hanski metapopulation models)  do not enforce \"conservation of mass\" when species move across space. Some do. We enable both. \nMutation specifically relates to Trait measurement developing a novel value due to a random event.\nSpeciation specifically relates to a Trait measuremeny where, for a given species emboidying a value of traits across spatial locations, the Speciation mechanism determines these entitites become discrete entities in the Metaweb (see metaweb).","category":"page"},{"location":"#Defining-mechanisms-and-dispatch","page":"Index","title":"Defining mechanisms and dispatch","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"The form in which any individual ::AbstractMechanism acts on a State is via dispatch on","category":"page"},{"location":"","page":"Index","title":"Index","text":"simulate!(mech::AbstractMechanism, oldstate::State, newstate::State)","category":"page"},{"location":"","page":"Index","title":"Index","text":"Note that Speciation models are unique in its dispatch patterns because it involves changing the metaweb, and therefore the allocation for new_state must be changed because it has a different number of species. This causes general problems. Wrap anything with a speciation model in a larger tensor with a MAX_SPECIES param? Who knows.","category":"page"},{"location":"#Combining-mechanisms","page":"Index","title":"Combining mechanisms","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"Only models corresponding to the same measurement type can be combined to create a ModelAssemablage, however multiple ModelAssemblages corresponding to different measurements can be combined into a single simulation.  ","category":"page"},{"location":"#Trajectories","page":"Index","title":"Trajectories","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"A trajectory (or trajectory assemblage) is a set of states.","category":"page"},{"location":"#Observers","page":"Index","title":"Observers","text":"","category":"section"},{"location":"","page":"Index","title":"Index","text":"VEL enables creating observers which sample from the virtual system across given spatial and temporal patterns, and which can simulate observation error.  ","category":"page"},{"location":"lib/internal/#Documentation-for-internal-methods","page":"Internal","title":"Documentation for internal methods","text":"","category":"section"},{"location":"lib/internal/","page":"Internal","title":"Internal","text":"Modules = [VirtualEcologyLab]\nPrivate = true\nPublic = false\nOrder = [:function]","category":"page"}]
}
