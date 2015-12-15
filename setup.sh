#!/usr/bin/env bash
# install toolchanin
apt-get -qqy install software-properties-common
add-apt-repository ppa:geoffrey-challen/os161-toolchain
apt-get -qq update
apt-get -qqy install os161-toolchain git gcc silversearcher-ag

# fetch os161 source code
cd /root
git clone https://github.com/benesch/os161.git src
cd src

# build user bin
./configure
bmake
bmake install

# build kern
cd kern/conf
./config ASST0
cd ../compile/ASST0
bmake depend
bmake
bmake install
cp /usr/share/examples/sys161/sys161.conf.sample /root/os161/root/sys161.conf
