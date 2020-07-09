FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -re -i "https://video-weaver.fra05.hls.ttvnw.net/v1/playlist/CtoDZOltGhGlqUJ4halsvmOuxGCqhTS9WV1bBrecxNN8PwWPvFkaoBGwt6n_m6ckTSNlHGthq2QDO6rGhs0afY8zo8Fl0htPGSgsHiRDwIa8CuXUiJoI9C8B0RrHv4qTkJqdA2Q26vZVb-OsTfX37k8FBg3cNFB6hH9Plq3DJ18GRmp0WWejGBolQMCMSdp1IPInxct_Fgcbt3RCwEOrj1DMGssOVAksVmfSVBBAaGbiVhlMyUGZPyrXBJmtNVRfK_2bMK5mF81U3v1-WKb9uqblPm4JLE_lAkhRKEWyyNt3x_tSrHWZL5cIY06oWxF2vWuhmsZfK5QJohekEZ8vlY2sdBEBbhbClv8tyKMz30GUZOs0zdg8KLJaULOJEnSrQ4qS3ZFuxETCnnSkECyDHCwG_vKrJ8xZOFEQPrHVTx_4zZNNytYqHCsvGTP6QkB-QMUyWUyl21wGa99Nsd9_uUjjvdVIbj5jvHmfd_3glYcjT3Vf0QLH_MjKEyEqYzvbeQmm35Q0UTsH_Mvwebgid5YBN_FJUWR8oGzvIn5-nUQi3wgbM0lD-P4P3zECXXHdZ-ynXHnK9sovEjkK_OG8wIQ0BqgKs3mvXLqQyijfEaByjL9BCChfbiEDKY7mEhAL46tDZKK6a46gEs687A4tGgydpFiuZzV4-ncZmf8.m3u8" -acodec libmp3lame -ar 44100 -b:a 128k -pix_fmt yuv420p -profile:v baseline -s 426x240 -bufsize 6000k -vb 400k -maxrate 1500k -deinterlace -vcodec libx264 -preset veryfast -g 30 -r 30 -f flv "rtmps://live-upload.instagram.com:443/rtmp/18115185835140422?s_efg=eyJxZV9ncm91cHMiOnsiaWdfbGl2ZV9lbmFibGVfcG9wX3ByaW1pbmciOnsiZW5hYmxlZCI6InRydWUifSwiaWdfbGl2ZV9ub3RpZmljYXRpb25zX2FmdGVyX2ZpcnN0X21wZF91bml2ZXJzZSI6W10sImlnX2xvd19sYXRlbmN5X3Byb2R1Y3Rpb25fdW5pdmVyc2UiOnsiZW5hYmxlZCI6InRydWUifX19&s_sw=0&s_vt=ig&a=AbzmWX8Cedj9dD8U"
