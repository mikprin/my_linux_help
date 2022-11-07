sudo pacman -Sy ffmpeg x264 x265 libjpeg6-turbo mariadb mariadb-clients dos2unix --noconfirm

mkdir -p ~/git
cd ~/git
git clone https://gitlab.com/Shinobi-Systems/Shinobi.git Shinobi
cd Shinobi
sudo npm install

#=====================================
#||=====   Install Completed   =====||
#=====================================
#|| Login with the Superuser and create a new user!!
#||===================================
#INSTALL/centos.sh: line 122: ifconfig: command not found
#|| Open http://:8080/super in your web browser.
#||===================================
#|| Default Superuser : admin@shinobi.video
#|| Default Password : admin
#=====================================
#=====================================
