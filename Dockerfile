FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -re -i "https://video-weaver.fra05.hls.ttvnw.net/v1/playlist/CtcDbeor9ZXr92yGvOCRwe5EhP6dgl3zIW8BbMncTn_EWo_s3tCZ3G7gpB61UxAn8ogHZoAhxzIBzCkS4UVzb6hqic4GKyoscY99iuyyo7rjY76nRXZ7UBbNu5UYn54VpYBGWwkC1EGZZmNGQdCpbS6LHrfF3uDIJSHUk8EqFNrVW5VrYZyCSroI4oFA78BLKNaJInL0yUUzSMmgn5ssB-Smxow77cKr9KrCZjBV4iIPSwo6F5yCeVZyfvxgdEoua5F3g_r5rqBNj1DGvNxR8E-EspRQWGJeg2iFgkugCn-EO4l3AFTEFdWFFFWW6wJUBBuot6KX6pQQ_t1V44Ub6w4cbrWhFM0tYuxiXYO3N5CBdiommMn1Z_1GDFEbTHRkX_LQrxvwts5lYIMJykZPRjDD94C7BBysTeIsoXjz3VOVyy2tBa0EzQb3oL4q3qeFZd8OIWc_kWH_sk4Ebb0wOgXGSZ2D8kuSAuFWOpRZe0EI-4R8-ji4HVQykPYrzfNORduTQRpT1kTHXBlsUDzSwnoW9bt7B2bPeGZlZcgPfTrxXXH_rnZhJukzgp6P-K3HRqH-Z7LTOK777pLwSYR475obEJavTV4znKEWf2dpTUm0lKFKFyugff5SEhAJYq2xFyH-EIIwZz3bwAm-Ggzd1NuemP6us5M4cxs.m3u8" -acodec libmp3lame -ar 44100 -b:a 128k -pix_fmt yuv420p -profile:v baseline -s 426x240 -bufsize 6000k -vb 400k -maxrate 1500k -deinterlace -vcodec libx264 -preset veryfast -g 30 -r 30 -f flv "rtmps://live-upload.instagram.com:443/rtmp/18105362533159599?s_efg=eyJxZV9ncm91cHMiOnsiaWdfbGl2ZV9lbmFibGVfcG9wX3ByaW1pbmciOnsiZW5hYmxlZCI6InRydWUifSwiaWdfbGl2ZV9ub3RpZmljYXRpb25zX2FmdGVyX2ZpcnN0X21wZF91bml2ZXJzZSI6W10sImlnX2xvd19sYXRlbmN5X3Byb2R1Y3Rpb25fdW5pdmVyc2UiOnsiZW5hYmxlZCI6InRydWUifX19&s_sw=0&s_vt=ig&a=AbxBG5oLJMJkgb4l"
