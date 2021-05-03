using VirtualEcologicalLaboratory

# constructing the type

LevinsMetapopulation(C, E) = StochasticColonization(C) + StochasticExtinction(E)



# example of how to use it 
numpopulations = 30
populations = generate(PoissonProcess, numpopulations) 
landscape = Landscape(populations, areas)
metaweb = SingleSpecies()
traj = Trajectory(Occupancy, metaweb, landscape)

simulate!(LevinsMetapopulation(0.3, 0.1), metaweb, landscape, traj)


