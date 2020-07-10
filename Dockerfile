FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -re -i https://video-weaver.fra05.hls.ttvnw.net/v1/playlist/CskDek5wCVXN9KXXTX3RBELUjs8h6vAAuk_L9XQdptRfrph6TS_E-hqvil-HyUq6O10gCYxSvm0nFgE7erh5_L7MjGFXC2lYylVTJGMRx2mnMlPp-lIPa2GUao0lKUeNZU4UVt8RxZl7va2dDDWModuH-jIwgPqpYyXFuxx0Lcnl0SwtoNWJAr9Wj2g89xgl2_t4NuxP5l-ez8HN3wKlQhUrjEao49ujumFJD_r9JMPChFbPZ8i2zsqES3fEZNcOaaa5HrDzGS94bN3qNJc44lcKiPDA4dP98yXP6NZQ774CMLOuYY2RB2ryzgdiq-_VrndOV3B4T_DrvzM8mDTqLbvwx1spzM7Ytn8nL7VIZJwYWfzNvCStv82ePqxQ-HtJu2BnqGAvnxyKZ30d-RhWuV-I1bzx7pLSEXYRHHxMD3s4eRa_5CfnJ2nFerERyy3z1GKEeJYKav9gYU_mk4_Q9kem2gGyXokuocaMWMJXqLDFfnl3F6D-E7E4ZIfWPBGndsx7S0Slh1KCk2AT5xTQ289LF1JoChywMdhqQF_h0ONSVpvuLz3vxOLB2v48MhhKL8AxtLW3tXzad2Ad1Bu53C5oUJMuzSa4F3fz_RIQOFOfVTTazfgElOO7XrrcMRoMhwhOOKMd1a85ky0j.m3u8 -c:v copy -c:a aac -ar 44100 -ab 128k -ac 2 -strict -2 -flags +global_header -bsf:a aac_adtstoasc -bufsize 3000k -f flv "    rtmps://live-upload.instagram.com:443/rtmp/17900628127502425?s_efg=eyJxZV9ncm91cHMiOnsiaWdfbGl2ZV9lbmFibGVfcG9wX3ByaW1pbmciOnsiZW5hYmxlZCI6InRydWUifSwiaWdfbGl2ZV9ub3RpZmljYXRpb25zX2FmdGVyX2ZpcnN0X21wZF91bml2ZXJzZSI6W10sImlnX2xvd19sYXRlbmN5X3Byb2R1Y3Rpb25fdW5pdmVyc2UiOnsiZW5hYmxlZCI6InRydWUifX19&s_sw=0&s_vt=ig&a=AbwCFIhKTs8ORPjM"
