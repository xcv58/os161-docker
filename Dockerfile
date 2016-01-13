FROM ubuntu:14.04
MAINTAINER Yihong Chen <ychen78@buffalo.edu>
ENV USER trinity
ENV HOME /home/${USER}
RUN adduser --disabled-password --gecos '' --shell /usr/bin/zsh --home ${HOME} ${USER}; \
        adduser ${USER} sudo; \
        echo "${USER} ALL=NOPASSWD: ALL" >> /etc/sudoers
USER ${USER}
COPY setup.sh /tmp/setup.sh
RUN /bin/bash /tmp/setup.sh
ENV HOSTNAME zion
WORKDIR ${HOME}
RUN echo "sudo sh -c \"echo 127.0.0.1 ${HOSTNAME} >> /etc/hosts\" 2> /dev/null" >> .bashrc
ENTRYPOINT zsh
