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
# Eating is a mechanism of type AbstractBioticSelectionModel, DiffusionDispersal is of AbstractDispersalModel
model = Eating(functional_response=YodzisInnes(masses)) +
        DiffusionDispersal(ibd=AllometricIBD(masses))

# memory allocation 
ntimesteps = 500
traj = Trajectory(Biomass, metaweb, landscape, ntimesteps)

simulate!(model, metaweb, landscape, traj)


