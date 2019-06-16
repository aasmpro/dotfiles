## node configes
### npm
creating a local direcotry for global node modules inside `$HOME`:
```
mkdir ~/.node_modules_global & npm config set prefix=$HOME/.node_modules_global && npm install npm@latest -g
```
remmber to add this path to the start of `$PATH` variable (`.bashrc` or `.zshrc`):
```
PATH="$HOME/.node_modules_global/bin:"+$PATH
```
