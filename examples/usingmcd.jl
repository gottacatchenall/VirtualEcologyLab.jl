using MetacommunityDynamics
using Dispersal
using VirtualEcologyLab
using DataFrames

const Δt = 0.1

consumermodel = (; A, CDP, CDR, CEP, CMR, kw...) ->
    Eating{Tuple{:C,:R}}(functionalresponse=LotkaVolterra(A), dt=Δt) +
    AdjacentBernoulliDispersal{:C}(DispersalKernel(radius=CDR), CDP) + 
    RandomExtinction{:R}(CEP) + 
    LinearMortality{:C}(CMR);

resourcemodel =
        (; λ, K, REP, RDR, RDP, kw...) -> 
            MetacommunityDynamics.LogisticGrowth{:R}(λ=λ, K=K, dt=Δt) +
            AdjacentBernoulliDispersal{:R}(DispersalKernel(radius=RDR), RDP) +
            RandomExtinction{:R}(REP) ;

modellist = [consumermodel, resourcemodel];

paramset = (
    λ = 1.0:0.1:1,        # growth rate
    K = [200],  # carrying cap
    REP = 0.01:0.01:0.1,  # resource extinction probability
    RDR = 3,            # resource dispersal radius
    RDP = 0.1:01:0.2,   # resource dispersal probability 

    A = 1:5,        # attack rate 
    CDP = 0:0.1:0.3,     # consumer dispersal probability
    CDR = 1:1:10,         # consumer dispersal radius 
    CEP = 0.0:0.01:0.1,   # consumer extinction probability 
    CMR = 0.0:0.01:0.2,   # consumer mortality rate 
)


metadata = treatments(paramset)
models = buildmodels(metadata, modellist)


function buildmodels(metadata, models)

    modellist = []

    for (i,paramset) in enumerate(eachrow(metadata))
        theseparams = NamedTuple(paramset)
        if length(modellist) > 1
            thismodel = models[begin](;theseparams...)
            for m in models[2:end]
                thismodel += m(;theseparams...)
            end
            push!(modellist, thismodel)
        else 
            push!(modellist, models)
        end
    end

    return modellist 
end