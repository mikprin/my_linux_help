

# Cut video!
`ffmpeg -i $INPUT_VIDEO_FILE -ss $START_TIME -t $STOP_TIME -c:v copy -c:a copy $OUTPUT_VIDEO_FILE`
`ffmpeg -i $INPUT_VIDEO_FILE -ss 00:00:00 -t 00:51:45 -c:v copy -c:a copy $OUTPUT_VIDEO_FILE`

# Join videos:

## concat demuxer

$ cat mylist.txt
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'
    
$ ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4


## concat protocol

Use this method with formats that support file-level concatenation (MPEG-1, MPEG-2 PS, DV). Do not use with MP4.

`ffmpeg -i "concat:input1|input2" -codec copy output.mkv`

This method does not work for many formats, including MP4, due to the nature of these formats and the simplistic concatenation performed by this method.



