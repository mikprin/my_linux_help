#!/usr/bin/bash
sudo pacman -S --noconfirm docker docker-compose

sudo systemctl enable docker.service; sudo systemctl enable docker.socket 

sudo usermod -aG docker $USER