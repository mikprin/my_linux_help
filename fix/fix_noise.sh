sudo sed -i 's/load-module module-udev-detect/load-module module-udev-detect tsched=0/g' /etc/pulse/default.pa

pulseaudio -k


#load-module module-udev-detect tsched=0
