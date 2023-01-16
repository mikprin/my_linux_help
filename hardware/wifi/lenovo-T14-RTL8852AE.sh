#!/usr/bin/env bash
# sudo apt-get update
# sudo apt-get install make gcc linux-headers-$(uname -r) build-essential git

git clone https://github.com/lwfinger/rtw89.git
cd rtw89
make -j4
sudo make install