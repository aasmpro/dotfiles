### install

```
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

### set default shell

```
chsh -s $(which zsh)
```

### extensions

following extensions are in oh-my-zsh

- git,
- python,
- django,
- pip,
- virtualenv,

following extensions must be installed manually

- zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
