# Julia dev container for apple sillicon
this is a fork from https://github.com/julia-vscode/julia-devcontainer

## build container
`docker build -t myjuliadev .`

## use container
1. install remote-container extension
2. create a `.devcontainer` folder in the folder you want to open in the container.
3. add file `devcontainer.json` inside `.devcontainer`.
4. add following to `devcontainer.json`:
```
{
	"name": "myvscodejuliadev",
	"image": "myjuliadev",
	"extensions": ["julialang.language-julia"],
	"postCreateCommand": "/julia-devcontainer-scripts/postcreate.jl",
	"remoteUser": "vscode"
}
```
5. Finally, press <kbd>F1</kbd> and run **Remote-Containers: Open Folder in Container** and select the folder containing your `.devcontainer`

