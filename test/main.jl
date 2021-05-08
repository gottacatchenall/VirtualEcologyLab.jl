using VirtualEcologyLab


species = DiscreteSpeciesPool(1)
locations = generate(PoissonProcess, 5)

models = RandomColonization{Occupancy}(0.3)  + RandomExtinction{Occupancy}(0.1)

ves = VirtualEcosystem(locations, species, models)

@time tr = simulate_trajectory(ves, ntimesteps=30)
mean(tr[1])
