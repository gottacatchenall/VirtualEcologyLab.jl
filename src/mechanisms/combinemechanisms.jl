

Base.:+(a::MechanismAssemblage, b::MechanismAssemblage) = combine(a, b)
Base.:+(a::Union{AbstractMechanism, MechanismAssemblage}, b::Union{AbstractMechanism, MechanismAssemblage}) = combine(a, b)

mechanisms(as::MechanismAssemblage) = as.mechanisms
Base.length(assem::MechanismAssemblage) = Base.length(mechanisms(assem))
Base.iterate(assem::MechanismAssemblage) = Base.iterate(mechanisms(assem))
Base.iterate(assem::MechanismAssemblage, i::Int64) = Base.iterate(mechanisms(assem), i)

function combine(a::AbstractMechanism, b::AbstractMechanism) 
    checktypes(a,b) && MechanismAssemblage([a,b])
end

checktypes(a::T,b::U) where {T <: AbstractMechanism, U <: MechanismAssemblage} = checktypes(b,a)
function checktypes(a::T,b::U) where {T <: MechanismAssemblage, U <: AbstractMechanism}
    # is either T or U contianed within the assemablage T/U
    for m in a 
        if (typeof(m) == typeof(U))
            @error "You are trying to add $b to a model assemblage $a, which already includes the type $U. At the moment, combining multiple models of the same type is not supported." 
            return false
        end
    end
    return true
end

function checktypes(a::T,b::U) where {T <: AbstractMechanism, U <: AbstractMechanism}
    if (T == U)
        @error "You are trying to combine $a and $b, which are the same type $T. At the moment, combining multiple models of the same type is not supported."
        return false
    end
    return true
end

function Base.convert(::Type{MechanismAssemblage}, a::T) where {T <: AbstractMechanism}
    MechanismAssemblage([a])
end


