#!/bin/bash

GIT_DIR=$HOME/git

mkdir -p $GIT_DIR

cd $GIT_DIR

git clone https://github.com/RinCat/RTL88x2BU-Linux-Driver.git

cd RTL88x2BU-Linux-Driver

make clean
make -j 6

sudo make install

