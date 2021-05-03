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


