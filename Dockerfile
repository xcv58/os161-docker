FROM xcv58/ubuntu
MAINTAINER xcv58 <i@xcv58.com>
ENV USER xcv58
ENV HOME /home/${USER}
USER ${USER}
COPY setup.sh /tmp/setup.sh
RUN /bin/bash /tmp/setup.sh
WORKDIR ${HOME}
ENTRYPOINT zsh
