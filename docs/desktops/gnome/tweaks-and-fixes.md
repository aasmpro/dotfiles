### firefox in dark themes
* open `about:config` in firefox
* creat new `string value` with following data:
```
name   >> widget.content.gtk-theme-override
value  >> Adwaita:light
```
* save and restart firefox

### GDM clock
for increasing clock font size on lock screen edit `.screen-shield-clock-time` in [`/usr/share/gnome-shell/theme/ubuntu.css`](ubuntu.css) file.
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