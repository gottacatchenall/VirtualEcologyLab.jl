abstract type AbstractGenerator end 
abstract type AbstractSpeciesPool end
abstract type AbstractTrajectory end

struct SummaryStat <: Function end
struct Time end 


struct Parameter{MT,VT}
    model::MT
    name::Symbol
    value::VT
end
    