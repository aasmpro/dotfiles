converting m4a to mp3

```
ffmpeg -i foo.m4a -acodec libmp3lame -aq 2 bar.mp3
```

for batch processing:

```
for foo in *.m4a; do ffmpeg -i "$foo" -acodec libmp3lame -aq 2 "${foo%.m4a}.mp3"; done
```
