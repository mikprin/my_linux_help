#!/bin/bash

mkdir -p ../mp4

for i in *.avi; do ffmpeg -i "$i" "../mp4/${i%.*}.mp4"; done