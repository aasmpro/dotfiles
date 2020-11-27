iconv can be used for converting encoding of files, as an example for subtitle files

```
iconv -t UTF-8 -f WINDOWS-1256//TRANSLIT subtitle.srt >> new_subtitle.srt
```
