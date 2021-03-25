module VirtualEcologicalLaboratory

    export AbstractDynamicsModel
    export AbstractDispersalModel, AbstractSelectionModel, AbstractDriftModel

    export BrownianMotion
    export DiffusionDispersal
    export DensityDependentSelection

    include("types/abstractdynamics.jl")
    include("types/checktypes.jl")

    include("dispersal_models/diffusion.jl")
    include("drift_models/brownian_motion.jl")
    include("selection_models/density_dependent.jl")

end # module




