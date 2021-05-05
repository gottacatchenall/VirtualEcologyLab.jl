using VirtualEcologyLab


sp = SpeciesPool([Species()])
locs = generate(PoissonProcess, 10)
models = StochasticColonization{Occupancy}(0.3)

ves = VirtualEcosystem(locs, sp, models)


traj = simulate(ves)

