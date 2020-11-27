showing all superblock backups
```
sudo dumpe2fs /dev/sdb1 | grep -i superblock
```
recovering superblock
```
sudo e2fsck -b 214990848 /dev/sdb1 -y
```