## Genymotion installation
(doc link)[https://docs.genymotion.com/latest/Content/01_Get_Started/Installation.htm]
Browse for the Oracle VM VirtualBox installer in your directories. 
If you do not have the installer or if you need to install a specific version, download and install VirtualBox for Linux hosts from the Download VirtualBox page.

When installing VirtualBox, in the Custom setup window, make sure VirtualBox Networking is enabled.
Go to the Genymotion download page and download the Linux package corresponding to your system.
Run the following commands:
```
chmod +x <Genymotion installer path>/genymotion-<version>_<arch>.bin
cd <Genymotion installer path>
./genymotion-<version>_<arch>.bin -d <Genymotion installer path>
```

Run Genymotion using the following command:
```
cd <Genymotion installer path>
./genymotion
```

Make sure that the dkms package is installed and that it compiles VirtualBox kernel modules each time a new kernel update is available.
To do so, run `sudo /etc/init.d/vboxdrv` status. You should get the message `VirtualBox kernel modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci) are loaded`. If not, force VirtualBox kernel modules compilation by running `sudo /etc/init.d/vboxdrv` setup.
Make also sure that you are part of the vboxusers group. If not, run `sudo usermod -a -G vboxusers <login>`.
