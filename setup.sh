#!/usr/bin/env bash

# install toolchanin
sudo apt-get -qqy install software-properties-common
sudo add-apt-repository -y ppa:geoffrey-challen/os161-toolchain
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get -qq update
sudo apt-get -qqy install os161-toolchain git gcc silversearcher-ag vim tmux zsh curl wget make tree golang

sudo locale-gen en_US.UTF-8

# fetch os161 source code
cd ~
git clone https://gitlab.ops-class.org/staff/os161.git src
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
cp /usr/share/examples/sys161/sys161.conf.sample ~/os161/root/sys161.conf

# setup dev tools
DEV_TOOLS=~/.devtools
mkdir -p ${DEV_TOOLS}

# setup zsh
cd ${DEV_TOOLS}
zsh
git clone --recursive https://github.com/xcv58/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
zsh "${ZDOTDIR:-$HOME}/.zprezto/link-dot-files.zsh"
sudo chsh -s /bin/zsh

# setup tmux
cd ${DEV_TOOLS}
git clone https://github.com/xcv58/tmux_conf.git tmux_conf
cd tmux_conf
sudo zsh install.zsh

# setup gdbinit
curl -L http://os161.xcv58.com | sudo bash
