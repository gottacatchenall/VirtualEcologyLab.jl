

function convert_to_list_of_transitions(models::ModelAssemblage)

end

function create_EcoSISTEM_ecosystem(ves::VirtualEcosystem)
    transitions = convert_to_list_of_transitions(ves.models)
    specieslist = convert_metaweb_to_species_list(ves.metaweb)
    abenv = convert_landscape_to_abenv(ves.landscape)

end