### Install

=== "Ubuntu"
    ```
    sudo apt install android-tools-fastboot
    ```

=== "Arch"
    ```
    # not encluded
    ```
### Flash
- go to `recovery` mode and wipe `cache` and `data` both
- connect phone to computer switch to `bootloader` using adb

```
sudo adb reboot bootloader
```

!!! info "you can also turn of phone and use `volume -` + `power`"

!!! info "check [splitupdata](../splitupdata) section for splitting `update.app`"

- in the same folder of splitted `update.app` files run these commands

```
sudo fastboot flash boot BOOT.img
sudo fastboot flash recovery RECOVERY.img
sudo fastboot flash cust CUST.img
sudo fastboot flash system SYSTEM.img
sudo fastboot reboot
```

- unplug usb when phone will reboot