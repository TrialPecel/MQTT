#!/bin/bash
DATE=$(date +%F)
TIME=$(date +%H%M%S)
DEVICE="cam01"
DEST="/mnt/nas_attendance/$DATE/$DEVICE"
mkdir -p "$DEST"
echo "[$(date)] Mulai rekaman: $DEST/${DEVICE}_${TIME}.mp4"
ffmpeg -f v4l2 -video_size 640x480 -framerate 15 -i /dev/video0 \
-c:v libx264 -preset ultrafast -tune zerolatency -b:v 800k \
-t 60 "$DEST/${DEVICE}_${TIME}.mp4"
echo "[$(date)] Rekaman selesai."
