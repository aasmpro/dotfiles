## gnome DE configes

### Flat Remix theme
[GTK theme](https://github.com/daniruiz/Flat-Remix-GTK)
[Gnome theme](https://github.com/daniruiz/flat-remix-gnome)
[Icons theme](https://github.com/daniruiz/Flat-Remix)

### installing themes
copy gtk and gnome themes in `/usr/share/themes` and icons in `/usr/share/icons` then set them with
```
gsettings set org.gnome.desktop.interface gtk-theme "custom-desktop-theme"
gsettings set org.gnome.desktop.wm.preferences theme "custom-desktop-theme"
gsettings set org.gnome.desktop.interface icon-theme "custom-icon-theme"
```

### add .desktop files for app luncher
these files must be in `~/.locale/share/applications` or for global access in `/usr/share/applications` dir.
```
[Desktop Entry]
Name=Pycharm
Comment=Pycharm prof
Exec=/home/aasmpro/.pycharm/bin/pycharm.sh
Icon=/home/aasmpro/.pycharm/bin/pycharm.png
Terminal=false
Type=Application
StartupNotify=true
StartupWMClass=Pycharm
Encoding=UTF-8
Categories=Application;
MimeType=x-scheme-handler/pycharm;
X-KDE-Protocols=pycharm
```

### night light with command
you can set a shortcut for with this command:
```
bash -c "if [[ $(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled) == "true" ]]; then gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false; else gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true; fi"
```

### fixing firefox in dark themes
* open `about:config` in firefox
* creat new `string value` with following data:
```
name   >> widget.content.gtk-theme-override
value  >> Adwaita:light
```
* save and restart firefox

### extensions
folders for extensions are
```
/usr/share/gnome-shell/extensions
~/.local/share/gnome-shell/extensions
```

installing user themes extension
```
sudo apt install gnome-shell-extensions
```

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

removeing unuseable extensions
```
cd ~/.local/share/gnome-shell/extensions && sudo rm -rf auto-move-windows@gnome-shell-extensions.gcampax.github.com apps-menu@gnome-shell-extensions.gcampax.github.com drive-menu@gnome-shell-extensions.gcampax.github.com launch-new-instance@gnome-shell-extensions.gcampax.github.com native-window-placement@gnome-shell-extensions.gcampax.github.com places-menu@gnome-shell-extensions.gcampax.github.com screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com ubuntu-dock@ubuntu.com ubuntu-appindicators@ubuntu.com window-list@gnome-shell-extensions.gcampax.github.com windowsNavigator@gnome-shell-extensions.gcampax.github.com workspace-indicator@gnome-shell-extensions.gcampax.github.com desktop-icons@csoriano
```
removing ubuntu dock
```
sudo apt remove gnome-shell-extension-ubuntu-dock
```

restart gnome shell after removing extensions

### GTK themes
* materia

[https://github.com/nana-4/materia-theme](https://github.com/nana-4/materia-theme)


### GDM themes
* materia

[https://github.com/nana-4/materia-theme/blob/master/src/gnome-shell/README.md](https://github.com/nana-4/materia-theme/blob/master/src/gnome-shell/README.md)

for increasing clock font size on lock screen edit `.screen-shield-clock-time` in `/usr/share/gnome-shell/theme/ubuntu.css` file.
also cusomized `ubuntu.css` file added.
```css
.screen-shield-arrows Gjs_Arrow {
  color: white;
  width: 0px;
  height: 0px;
  -arrow-thickness: 12px;
  -arrow-shadow: 0 1px 1.5px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
}

.screen-shield-clock-time {
  font-size: 300px;
  font-weight: 500;
}

.screen-shield-clock-date {
  font-size: 0px;
  font-weight: 400;
}
```

### icon themes
* papirus

[https://github.com/PapirusDevelopmentTeam/papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)


### cursor themes
* capitaine

[https://github.com/keeferrourke/capitaine-cursors](https://github.com/keeferrourke/capitaine-cursors)


### fonts
* google roboto
```
sudo yum install google-roboto-fonts.noarch
sudo apt install fonts-roboto*
```
