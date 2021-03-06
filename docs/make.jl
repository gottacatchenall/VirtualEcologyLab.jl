using Documenter, VirtualEcologyLab

makedocs(
    sitename="VirtualEcologyLab.jl",
    authors="Michael Catchen",
    modules=[VirtualEcologyLab],
    pages=[
        "Index" => "index.md",
        ]
)

deploydocs(
    deps=Deps.pip("pygments", "python-markdown-math"),
    repo="github.com/gottacatchenall/VirtualEcologyLab.jl.git",
    devbranch="main",
    push_preview=true
)
