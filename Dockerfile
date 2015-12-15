# This is a comment
FROM ubuntu:14.04
MAINTAINER Yihong Chen <ychen78@buffalo.edu>
COPY setup.sh /tmp/setup.sh
RUN /bin/bash /tmp/setup.sh
RUN rm /tmp/setup.sh
ENV HOME /root
WORKDIR ${HOME}
