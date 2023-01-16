#!/bin/bash

sudo apt update && sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
apt install python3.8
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.8 get-pip.py