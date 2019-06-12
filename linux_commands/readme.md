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
or find by address and exclude environments too:
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
### merging pdf files
```
pdftk file1.pdf file2.pdf cat output out.pdf
```
### ffmpeg converting m4a to mp3
```
ffmpeg -i foo.m4a -acodec libmp3lame -aq 2 bar.mp3
```
for batch processing:
```
for foo in *.m4a; do ffmpeg -i "$foo" -acodec libmp3lame -aq 2 "${foo%.m4a}.mp3"; done
```
