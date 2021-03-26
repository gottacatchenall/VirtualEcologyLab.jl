struct Trait <: AbstractObservationType
    val::Float64
end
Base.zero(::Type{Trait}) = Trait(0.)

