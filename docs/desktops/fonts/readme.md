## Fonts
### commands

- `fc-cache` will make new configs
- `fc-match` will show your seted fonts
- `fc-list` will show your known fonts list

### configurations
base on arch wiki about [font configuration](https://wiki.archlinux.org/index.php/Font_configuration#Fontconfig_configuration), system wide fonts will be configed by `/etc/fonts/local.conf` in case you dont have this file create one.

this file will be used to set system wide configs while using `fc-cache` command.

### example
to override system wide fonts for `fa` language to use `Vazir` font:
```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<match>
	<edit mode="prepend" name="family">
		<string>Vazir</string>
	</edit>
</match>
<match>
	<test compare="contains" name="lang">
		<string>fa</string>
	</test>
	<edit mode="prepend" name="family">
		<string>Vazir</string>
	</edit>
</match>
</fontconfig>
```
