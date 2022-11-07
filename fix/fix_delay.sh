sudo sed -i 's/load-module module-suspend-on-idle/# load-module module-suspend-on-idle/g' /etc/pulse/default.pa

pulseaudio -k
