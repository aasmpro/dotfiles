## Grub
### configs
configs are located in `/etc/default/grub` so you should change this file for configs

### commands
- `grub-mkconfig -o /boot/grub/grub.cfg` to create new config
- `sed -i 's/echo/#echo/g' /boot/grub/grub.cfg` to comment echos in grub.cfg
