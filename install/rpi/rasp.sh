



sudo sed -i 's/# dtparam=spi=on/dtparam=spi=on/g' /boot/config.txt
sudo sed -i 's/#dtparam=spi=on/dtparam=spi=on/g' /boot/config.txt


sudo apt-get install python3-dev python3-pip
sudo pip3 install spidev
