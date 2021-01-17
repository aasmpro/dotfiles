- `fc-cache` will make new configs
- `fc-match` will show your seted fonts
- `fc-list` will show your known fonts list

### [configs](fonts/local.conf)
base on arch wiki about [font configuration](https://wiki.archlinux.org/index.php/Font_configuration#Fontconfig_configuration), system wide fonts will be configed by `/etc/fonts/local.conf` in case you dont have this file create one.

this file will be used to set system wide configs while using `fc-cache` command.

to override system wide fonts for `fa` language to use `Vazir` font:

```
{% include "desktops/fonts/local.conf" %}
```
