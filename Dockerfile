FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -re -i "http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8" -acodec libmp3lame -ar 44100 -b:a 128k -pix_fmt yuv420p -profile:v baseline -s 426x240 -bufsize 6000k -vb 400k -maxrate 1500k -deinterlace -vcodec libx264 -preset veryfast -g 30 -r 30 -f flv "rtmps://live-upload.instagram.com:443/rtmp/18105362533159599?s_efg=eyJxZV9ncm91cHMiOnsiaWdfbGl2ZV9lbmFibGVfcG9wX3ByaW1pbmciOnsiZW5hYmxlZCI6InRydWUifSwiaWdfbGl2ZV9ub3RpZmljYXRpb25zX2FmdGVyX2ZpcnN0X21wZF91bml2ZXJzZSI6W10sImlnX2xvd19sYXRlbmN5X3Byb2R1Y3Rpb25fdW5pdmVyc2UiOnsiZW5hYmxlZCI6InRydWUifX19&s_sw=0&s_vt=ig&a=AbxBG5oLJMJkgb4l"
