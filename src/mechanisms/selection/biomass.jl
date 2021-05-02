struct Eating{OT <: Biomass} <: AbstractBioticSelectionModel
    F::Float64   # functional reponse
    consumer::Species  
    resource::Species  
end