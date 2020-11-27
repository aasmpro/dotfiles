
configs are located in `/etc/default/grub` so you should change this file for configs

=== "create new config"
    ```
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

=== "comment echos in grub.cfg"
    ```
    sed -i 's/echo/#echo/g' /boot/grub/grub.cfg
    ```

### [configs](../grub)

```
{% include "OS/grub/grub" %}
```