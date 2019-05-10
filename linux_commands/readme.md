### some use full linux commands
##### deleteing all migration files in project
```
find . -iname "00*.py" -delete
```
##### convert windows unicode to utf-8
```
iconv -t UTF-8 -f WINDOWS-1256//TRANSLIT subtitle.srt >> new_subtitle.srt
```
##### create bootable tumb-drive
```
sudo dd bs=4M if=file.iso of=/dev/sdx conv=fdatasync
```
