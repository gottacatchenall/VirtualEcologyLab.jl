using Documenter, VirtualEcologyLab

makedocs(
    sitename="VirtualEcologyLab.jl",
    authors="Michael Catchen",
    modules=[VirtualEcologyLab],
    pages=[
        "Index" => "index.md",
        "Interface" => [
            "Types" => "interfaces/types.md",
        ],
        "Case Studies" => [
            "Metapopulations" => "casestudies/metapopulation_models.md",
        ],
        "Library" => [
            "Internal" => "lib/internal.md",
            "Public API" => "lib/public.md",
        ],
        ]
)

deploydocs(
    deps=Deps.pip("pygments", "python-markdown-math"),
    repo="github.com/gottacatchenall/VirtualEcologyLab.jl.git",
    devbranch="main",
    push_preview=true
)
