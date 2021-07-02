
function method_argnames(m::Method)
    argnames = ccall(:jl_uncompress_argnames, Vector{Symbol}, (Any,), m.slot_syms)
    isempty(argnames) && return argnames
    return argnames[1:m.nargs]
end

function treatments(paramset)
    names = []
    vals = []
    md = DataFrame(treatment = [])

    for (param_name, param_values) in zip(keys(paramset), paramset)
        push!(names, param_name)
        push!(vals, param_values)
        md[!,  Symbol(param_name)] = []
    end
    ct = 1

    for p in Iterators.product(vals...)
        for (i, val) in enumerate(p)
            param = names[i]
            push!(md[!, Symbol(param)], val)
        end
        push!(md.treatment, ct)
        ct += 1
    end
    return(md)
end