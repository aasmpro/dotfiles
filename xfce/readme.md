# xfce4 configes
## debian buster
### enabling tap to click
```
sudo apt remove xserver-xorg-input-synaptics
sudo apt install xserver-xorg-input-libinput
```
copy `40-libinput.conf` to `/etc/X11/xorg.conf.d/` then restart `lightdm`:
```
sudo systemctl restart lightdm
```

### read-only file system in ntfs mounted drives
using ntfs-3g
```
sudo apt-get remove ntfsprogs && sudo apt-get install ntfs-3g
```
and restarting system

### enabling i386 architecture
```
sudo dpkg --add-architecture i386
```
> for installing `steam` this is reaquired

## themes
for refrence check [this](https://wiki.xfce.org/howto/install_new_themes) url.

* copy `aasmpro` folder to `/usr/share/themes/`

and select the aasmpro theme in both `appearance` and `window manager`
