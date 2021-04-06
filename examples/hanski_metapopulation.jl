using VirtualEcologicalLaboratory
using Distributions: Exponential


numpopulations = 30
meanarea = 3

populations = generate(PoissonProcess, numpopulations) 
areas = generate(StaticEnvironmentalVariable, populations, Exponential(meanarea))

landscape = Landscape(populations, areas)

metaweb = SingleSpecies()

model = (landscape) -> StochasticColonization(0.3) + StochasticExtinction(0.1)

traj = Trajectory()

simulate!(model, metaweb, landscape, traj)


