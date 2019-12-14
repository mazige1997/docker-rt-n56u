FROM ubuntu:18.04
MAINTAINER shellus <shellus@endaosi.com>

RUN apt-get update
RUN apt-get install -y git sudo autoconf automake autopoint bison build-essential flex gawk gettext git gperf libtool pkg-config zlib1g-dev libgmp3-dev libmpc-dev libmpfr-dev texinfo python-docutils module-init-tools
RUN mkdir -p /opt && git clone --depth=1 https://github.com/chongshengB/rt-n56u.git /opt/rt-n56u
RUN cd /opt/rt-n56u/toolchain-mipsel && ./clean_sources && ./build_toolchain
RUN cd /opt/rt-n56u/trunk && ./clear_tree

# build firmware first
RUN cd /opt/rt-n56u/trunk && ./build_firmware

COPY init /init
RUN chmod +x /init

CMD ["/init"]
