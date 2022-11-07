#!/bin/bash

sudo pacman -Sy && sudo pacman -S cockpit 

sudo systemctl start cockpit.service

sudo systemctl enable cockpit.service
#○ cockpit.service - Cockpit Web Service
#     Loaded: loaded (/usr/lib/systemd/system/cockpit.service; static)
#     Active: inactive (dead)
#TriggeredBy: ○ cockpit.socket
#       Docs: man:cockpit-ws(8)
#➜  ~ sudo systemctl start cockpit.service 
#➜  ~ sudo systemctl enable cockpit.service 
#The unit files have no installation 