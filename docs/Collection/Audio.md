# Audio and Video Recording

```bash
ffmpeg -f alsa -ac 2 -i default -acodec libopus -threads 0 -y output.mka
```

```bash
ffmpeg -f x11grab -r 20 -s 1920x1080 -i :0.0 -vcodec libx265 -preset fast -b:v 500k -threads 0 -y output.6.mkv
```

```bash
ffmpeg -f pulse -ac 2 -i default -f x11grab -r 20 -s 1920x1080 -i :0.0 -acodec aac -vcodec libx264 -preset ultrafast -b:v 900k -threads 0 -y output.mkv
```
