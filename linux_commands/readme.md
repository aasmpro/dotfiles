## some useful linux commands
### superblock problems
showing all superblock backups
```
sudo dumpe2fs /dev/sdb1 | grep -i superblock
```
recovering superblock
```
sudo e2fsck -b 214990848 /dev/sdb1 -y
```
### deleteing all migration files in project
```
find . -iname "00*.py" -delete
```
or by find by address and exclude environments too:
```
find . -iwholename "*/migrations/00*.py" -not -path "*_env*" -delete
```
### convert windows unicode to utf-8
```
iconv -t UTF-8 -f WINDOWS-1256//TRANSLIT subtitle.srt >> new_subtitle.srt
```
### create bootable tumb-drive
```
sudo dd bs=4M if=file.iso of=/dev/sdx conv=fdatasync
```
