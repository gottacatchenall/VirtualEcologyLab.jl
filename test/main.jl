using VirtualEcologyLab
using Profile
using ProfileView   
using Revise


species = DiscreteSpeciesPool(10)
locations = generate(PoissonProcess, 10)
models = StochasticColonization{Occupancy}(0.3)

ves = VirtualEcosystem(locations, species, models)

@time tr = simulate_trajectory(ves)

