# VEL needs the following functions to work

parameters(rs::Ruleset) = map(r -> Dict(r => parameters(r)),  rules(rs))

function parameters(r::R) where {R <: Rule}
    params = []
    fields = [
        :($name) for name in fieldnames(R)
    ]
    for f in fields
        val = getproperty(r,f)
        p = (r,f,val)
        push!(params, p)
    end
    return params
end

