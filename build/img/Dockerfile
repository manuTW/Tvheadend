FROM ubuntu
MAINTAINER sb

# need /mysrc be mounted as the source volume
RUN apt-get update && apt-get install -y gcc make libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev && mkdir -p /root/Videos
ADD install /usr/local/bin/myinstall

CMD ["/bin/bash", "/mysrc/install.sh"]

