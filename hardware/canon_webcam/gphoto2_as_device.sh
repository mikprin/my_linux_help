#!/usr/bin/env bash
sudo modprobe v4l2loopback
gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2
# gphoto2 --stdout --set-config liveviewsize=0 --capture-movie | ffmpeg  -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 -s:v 1920x1080 -r 25 /dev/video0