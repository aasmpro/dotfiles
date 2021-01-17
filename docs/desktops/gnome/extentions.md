folders for extensions are
```
/usr/share/gnome-shell/extensions
~/.local/share/gnome-shell/extensions
```

### user themes
```
sudo apt install gnome-shell-extensions
```

### install
you can also install extensions using:
```
https://extensions.gnome.org
```

following extensions are used

* Alternatetab
* Hide activities button
* Hide dash x
* Hide top bar
* Dash to panel
* Unblanck screen saver
* More columns in applications view
* Remove app menu
* Remove dropdown arrows
* Remove rounded corners
* Hide workspace thumbnails
* Appfolders Management extension
* CustomCorner

### uninstall unusable extentions
```
cd ~/.local/share/gnome-shell/extensions && sudo rm -rf auto-move-windows@gnome-shell-extensions.gcampax.github.com apps-menu@gnome-shell-extensions.gcampax.github.com drive-menu@gnome-shell-extensions.gcampax.github.com launch-new-instance@gnome-shell-extensions.gcampax.github.com native-window-placement@gnome-shell-extensions.gcampax.github.com places-menu@gnome-shell-extensions.gcampax.github.com screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com ubuntu-dock@ubuntu.com ubuntu-appindicators@ubuntu.com window-list@gnome-shell-extensions.gcampax.github.com windowsNavigator@gnome-shell-extensions.gcampax.github.com workspace-indicator@gnome-shell-extensions.gcampax.github.com desktop-icons@csoriano
```

### uninstall ubuntu dock
```
sudo apt remove gnome-shell-extension-ubuntu-dock
```

!!! info "restart gnome shell after removing extensions"
