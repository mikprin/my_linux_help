


sudo apt install gnupg1 apt-transport-https dirmngr

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

sudo echo "deb https://ookla.bintray.com/debian generic main" | sudo tee /etc/apt/sources.list.d/speedtest.list

sudo apt remove speedtest-cli

sudo apt update

sudo apt install speedtest
