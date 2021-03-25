struct ModelAssemblage 
    models::AbstractVector{AbstractDynamicsModel}
end 

Base.:+(a::Union{AbstractDynamicsModel, ModelAssemblage}, b::Union{AbstractDynamicsModel, ModelAssemblage}) = combinemodels(a, b)

function combinemodels(a::AbstractDynamicsModel, b::AbstractDynamicsModel) 
    checktypes(a,b) && ModelAssemblage([a,b])
end

checktypes(a::T,b::U) where {T <: AbstractDynamicsModel, U <: ModelAssemblage} = checktypes(b,a)
function checktypes(a::T,b::U) where {T <: ModelAssemblage, U <: AbstractDynamicsModel}
    # is either T or U contianed within the assemablage T/U
    for m in a 
        if (typeof(m) == typeof(U))
            @error "You are trying to add $b to a model assemblage $a, which already includes the type $U. At the moment, combining multiple models of the same type is not supported." 
            return false
        end
    end
    return true
end

function checktypes(a::T,b::U) where {T <: AbstractDynamicsModel, U <: AbstractDynamicsModel}
    if (T == U)
        @error "You are trying to combine $a and $b, which are the same type $T. At the moment, combining multiple models of the same type is not supported."
        return false
    end
    return true
end
