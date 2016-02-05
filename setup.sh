#!/usr/bin/env bash

# install toolchanin
sudo add-apt-repository -y ppa:geoffrey-challen/os161-toolchain
sudo apt-get -qq update
sudo apt-get -qqy install os161-toolchain

sudo locale-gen en_US.UTF-8

# setup gdbinit
curl -L http://os161.xcv58.com | sudo bash

# fetch os161 source code
cd ~
git clone https://gitlab.ops-class.org/staff/os161.git src
cd src

# build user bin
./configure
bmake
bmake install

# build kern
a b
cp /usr/share/examples/sys161/sys161.conf.sample ~/os161/root/sys161.conf
