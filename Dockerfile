FROM ubuntu:14.04
MAINTAINER Yihong Chen <ychen78@buffalo.edu>
ENV USER trinity
ENV HOME /home/${USER}
RUN adduser --disabled-password --gecos '' --home ${HOME} ${USER}; \
        adduser ${USER} sudo; \
        echo "${USER} ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN echo "127.0.1.1    zion" >> /etc/hosts
USER ${USER}
COPY setup.sh /tmp/setup.sh
RUN /bin/bash /tmp/setup.sh
ENV HOSTNAME zion
WORKDIR ${HOME}
