---
title: FFmpeg
description: FFmpeg is a free and open-source software project consisting of a suite of libraries and programs for handling video, audio, and other multimedia files and streams.
---

# FFmpeg

FFmpeg is a free and open-source software project consisting of a suite of libraries and programs for handling video, audio, and other multimedia files and streams.

## x265

[x265](https://x265.readthedocs.io/en/master/) is a H.265/HEVC encoder.

An application for encoding video streams into the H.265/MPEG-H HEVC compression format.

### Basic Commands

1. Simple encoding:

   ```bash
   x265 inputFile.y4u outFile.hevc
   ```

   > Only _`yuv`_ or _`y4m`_ can be used as input!

2. Encoding Statistics:

   - CLI log:

     ```bash
     --log-level <integer|string>
     ```

     _where_

     | value | log-level      |
     | ----- | -------------- |
     | 0     | error          |
     | 1     | warning        |
     | 2     | info (default) |
     | 3     | debug          |
     | 4     | full           |
     | -1    | disable        |

   - Statistics output to file :

     ```bash
     --csv <filename>
     ```

     - If **`--csv-log-level`** is `0` then _one line per run_.
     - If _greater_ than `0` then _one line per frame_.

3. Progress:

   ```bash
   --no-progress
   ```

   > Disable periodic progress reports from the CLI

## Audio and Video Recording

```bash
ffmpeg -f alsa -ac 2 -i default -acodec libopus -threads 0 -y output.mka
```

```bash
ffmpeg -f x11grab -r 20 -s 1920x1080 -i :0.0 -vcodec libx265 -preset fast -b:v 500k -threads 0 -y output.6.mkv
```

```bash
ffmpeg -f pulse -ac 2 -i default -f x11grab -r 20 -s 1920x1080 -i :0.0 -acodec aac -vcodec libx264 -preset ultrafast -b:v 900k -threads 0 -y output.mkv
```
