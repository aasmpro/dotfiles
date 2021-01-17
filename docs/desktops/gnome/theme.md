### install
copy gtk and gnome themes in `/usr/share/themes` and icons in `/usr/share/icons` then set them with `tweaks` or `gsettings`
```
gsettings set org.gnome.desktop.interface gtk-theme "custom-desktop-theme"
gsettings set org.gnome.desktop.wm.preferences theme "custom-desktop-theme"
gsettings set org.gnome.desktop.interface icon-theme "custom-icon-theme"
```

### GTK
[Materia](https://github.com/nana-4/materia-theme)
[Flat Remix](https://github.com/daniruiz/Flat-Remix-GTK)
[Flat Remix shell](https://github.com/daniruiz/flat-remix-gnome)

### GDM
[Materia](https://github.com/nana-4/materia-theme/blob/master/src/gnome-shell/README.md)

### Icons
[Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
[Flat Remix](https://github.com/daniruiz/Flat-Remix)

### Cursor
[Capitaine](https://github.com/keeferrourke/capitaine-cursors)

### Fonts
Roboto

=== "Debian base"
    ```
    sudo apt install fonts-roboto*
    ```

=== "RHEL base"
    ```
    sudo yum install google-roboto-fonts.noarch
    ```