sudo pacman -S --noconfirm samba

sudo groupadd samba

sudo gpasswd -a $USER samba


sudo mkdir -p /srv/smb/private/

sudo setfacl -R -m "g:samba:rwx" /srv/smb/private/

testparm