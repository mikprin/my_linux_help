

Extracting Lossless/ Lossy Audio from Videos (flv / mp4 to wav / flac / mp3) Using ffmpegversion 2.3.1 in Ubuntu 14.04

Visit: http://howto-pages.org/ffmpeg/

First of all find the basic data from the source. Open the video in VLC Player. Go to

> Tools > Codec Information 
> Stream 0 (Video/ Codec/ Resolution/ Frame rate) 
> Stream 1 (Audio/ Codec/ Channel/ Sample rate)

Consider an input file (-i), such as, input.mp4 or other files- flv, avi, ...). To remove the video (-vn) and take audio out uncompressed (output.wav) at a sample rate of 44100 Hz (-ar 44100) in pulse code modulated with signed, 16 bit, little endian (-acodec pcm_s16le) samples and 2 channels (stereo) (-ac 2) use the following command.

ffmpeg -i input.mp4 -vn -acodec pcm_s16le -ar 44100 -ac 2 output.wav

Other -acodec options are mp3 flac m4a.

-acode flac converts to 24 bit file. For 16 bit sampling it should be

ffmpeg -i input.mp4 -acodec flac -bits_per_raw_sample 16 -ar 44100 output.flac

wav and flac files are larger than the mp4 file

ac3 conversion works with -acodec 3F2R/LFE -ac 6 but creats 4 dummy tracks, as checked in Audacity.

For mp3 conversion, simply use

ffmpeg -i input.mp4 -vn -acodec mp3 -ab 320k -ar 44100 -ac 2 output.mp3

One could get more options for both input and output by trying from the list obtained from command line on the terminal

$ ffmpeg -help

