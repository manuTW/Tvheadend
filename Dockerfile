FROM tv407_raw
MAINTAINER sb

#tv407_raw is generated by gen407.sh then tv407
ENV LD_LIBRARY_PATH /usr/local/lib
EXPOSE 9981 9982
RUN mkdir /lib/tv
COPY modules.tgz /lib/tv/modules.tgz
CMD ["/usr/local/bin/tvheadend", "-C", "-d"]
