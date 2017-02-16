# ffmpeg-nodejs
#
# FFMPEG-VERSION               2.8.1-1
# NODEJS-VERSION               4.2.2
# VERSION               
#
# From https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
# From https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
#
#

FROM          centos:7
MAINTAINER    Raman Nanda <Raman148@gmail.com>


ENV           FFMPEG_VERSION=3.0.7   \
              MPLAYER_VERSION=1.3.0  \
              YASM_VERSION=1.3.0     \
              OGG_VERSION=1.3.2      \
              VORBIS_VERSION=1.3.5   \
              THEORA_VERSION=1.1.1   \
              LAME_VERSION=3.99.5    \
              OPUS_VERSION=1.1.4     \
              FAAC_VERSION=1.28      \
              VPX_VERSION=1.6.1      \
              XVID_VERSION=1.3.4     \
              FDKAAC_VERSION=0.1.5   \
              X265_VERSION=2.3       \
              NODEJS_VERSION=6.9.5 

COPY ./install/0-preinstall.sh /tmp/0-preinstall.sh
COPY ./install/10-yasm.sh /tmp/10-yasm.sh
COPY ./install/11-x264.sh /tmp/11-x264.sh
COPY ./install/11-x265.sh /tmp/11-x265.sh
COPY ./install/12-libogg.sh /tmp/12-libogg.sh
COPY ./install/13-libopus.sh /tmp/13-libopus.sh
COPY ./install/14-libvorbis.sh /tmp/14-libvorbis.sh
COPY ./install/15-libtheora.sh /tmp/15-libtheora.sh
COPY ./install/16-libvpx.sh /tmp/16-libvpx.sh
COPY ./install/17-libmp3lame.sh /tmp/17-libmp3lame.sh
COPY ./install/18-faac.sh /tmp/18-faac.sh
COPY ./install/19-xvid.sh /tmp/19-xvid.sh
COPY ./install/20-fdk-aac.sh /tmp/20-fdk-aac.sh
COPY ./install/21-ffmpeg.sh /tmp/21-ffmpeg.sh
COPY ./install/22-mplayer.sh /tmp/22-mplayer.sh
COPY ./install/30-nodejs.sh /tmp/30-nodejs.sh
COPY ./install/40-postinstall.sh /tmp/40-postinstall.sh

RUN bash /tmp/0-preinstall.sh
RUN bash /tmp/10-yasm.sh
RUN bash /tmp/11-x264.sh
RUN bash /tmp/11-x265.sh
RUN bash /tmp/12-libogg.sh
RUN bash /tmp/13-libopus.sh
RUN bash /tmp/14-libvorbis.sh
RUN bash /tmp/15-libtheora.sh
RUN bash /tmp/16-libvpx.sh
RUN bash /tmp/17-libmp3lame.sh
RUN bash /tmp/18-faac.sh
RUN bash /tmp/19-xvid.sh
RUN bash /tmp/20-fdk-aac.sh
RUN bash /tmp/21-ffmpeg.sh
RUN bash /tmp/22-mplayer.sh
RUN bash /tmp/30-nodejs.sh
RUN bash /tmp/40-postinstall.sh

# Let's make sure the app built correctly
RUN           ffmpeg -buildconf

# Make sure Node.js is installed
RUN           node -v
RUN           npm -v

