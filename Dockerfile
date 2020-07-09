FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -re -i http://163.172.134.85/hls/stream.m3u8 -c:v copy -c:a aac -ar 44100 -ab 128k -ac 2 -strict -2 -flags +global_header -bsf:a aac_adtstoasc -bufsize 3000k -f flv "rtmps://live-upload.instagram.com:443/rtmp/18115185835140422?s_efg=eyJxZV9ncm91cHMiOnsiaWdfbGl2ZV9lbmFibGVfcG9wX3ByaW1pbmciOnsiZW5hYmxlZCI6InRydWUifSwiaWdfbGl2ZV9ub3RpZmljYXRpb25zX2FmdGVyX2ZpcnN0X21wZF91bml2ZXJzZSI6W10sImlnX2xvd19sYXRlbmN5X3Byb2R1Y3Rpb25fdW5pdmVyc2UiOnsiZW5hYmxlZCI6InRydWUifX19&s_sw=0&s_vt=ig&a=AbzmWX8Cedj9dD8U"
