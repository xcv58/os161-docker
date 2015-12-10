# This is a comment
FROM ubuntu:14.04
MAINTAINER Yihong Chen <ychen78@buffalo.edu>
RUN apt-get -qqy install software-properties-common
RUN add-apt-repository ppa:geoffrey-challen/os161-toolchain
RUN apt-get -qq update
RUN apt-get -qqy install os161-toolchain git gcc
RUN cd /root; git clone https://github.com/benesch/os161.git src; cd src; ./configure; bmake; bmake install; cd kern/conf; ./config ASST0; cd ../compile/ASST0; bmake depend; bmake; bmake install
RUN cp /usr/share/examples/sys161/sys161.conf.sample /root/os161/root/sys161.conf
