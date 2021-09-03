# stream-video-downloader
A tool to download stream videos in batch. 

The `./bin` folder should contain the `ffmpeg.exe` which can be downloaded from https://ffmpeg.org/download.html.

You also need to specify in the `input.txt` file the URL of the stream videos and the name of the video downloaded. The separator is white spaces.

```
https://resource.abc.com/1571/c5096b862b.mp4  HowToCook
```

The `./output` folder will be created if not exisint to keep the downloaded videos with the names you provide
```
HowToCook.mp4
```
