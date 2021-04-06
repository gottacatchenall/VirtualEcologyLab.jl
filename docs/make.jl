using Documenter, VirtualEcologicalLaboratory

makedocs(
    sitename="VirtualEcologyLab.jl",
    authors="Michael Catchen",
    modules=[MetacommunityDynamics],
    pages=[
        "Index" => "index.md",
        ]
)

deploydocs(
    deps=Deps.pip("pygments", "python-markdown-math"),
    repo="github.com/gottacatchenall/VirtualEcologicalLaboratory.jl.git",
    devbranch="main",
    push_preview=true
)
