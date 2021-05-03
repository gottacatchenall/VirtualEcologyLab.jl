using VirtualEcologicalLaboratory
using Distributions: Exponential


numpopulations = 50
numspecies = 30
meanconnectance = 0.15

metaweb = NicheModel(0.15)
trophiclevs = trophiclevels(metaweb)

landscape = Landscape(populations, areas)

populations = generate(PoissonProcess, numpopulations) 

masses = generate(Trait, metaweb, (s) -> 10^(trophiclevs[s]))




model = (landscape) -> Eating() 

# memory allocation 
traj = Trajectory(Occupancy, metaweb, landscape)

simulate!(model, metaweb, landscape, traj)


