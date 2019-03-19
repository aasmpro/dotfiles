# Android configes
## ADB
install ADB using this command
```
sudo apt install android-tools-adb
```

## Huawei Honor 7 PLK-L01 C636B130
> in case of upgrading from default update system, region must be same ( here region is C636 ) and buildnumber must be upper than current build number. but if you flash using `fastboot` none is important ( it has been said that android version must be same in this case but i have done it with none same too )
[this](https://forum.xda-developers.com/general/general/guide-flash-variant-version-firmware-t3506404) could be helpful for both `unlocking` and `flashing` proccess

### stock rom
can be downloaded from [C636B371 android 6](http://huawei-firmware.com/rom/huawei-honor-7/plk-l01/4970)

### splitting `update.app`
you can use [splitupdata](https://github.com/marcominetti/split_updata.pl) for splitting this file. ( script included check `splitupdata` folder )

### flash using `fastboot`
1. install `fastboot` with this command
```
sudo apt install android-tools-fastboot
```
2. go to `recovery` mode and wipe `cache` and `data` both
3. connect phone to computer switch to `bootloader` using adb 
```
sudo adb reboot bootloader
```
or turn of phone and use `volume -` + `power`

4. in the same folder of splitted `update.app` files run these commands
```
sudo fastboot flash boot BOOT.img
sudo fastboot flash recovery RECOVERY.img
sudo fastboot flash cust CUST.img
sudo fastboot flash system SYSTEM.img
sudo fastboot reboot
```
5. unplug usb when phone will reboot

### update using `update.app`
1. copy `update.app` file to `dload` folder in root of sdcard
2. trun off phone, then use `volume +` + `volume -` + `power` keys to load `update` mode
> this method needs stock recovery