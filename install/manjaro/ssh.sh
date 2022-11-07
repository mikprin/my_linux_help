sudo pacman -S openssh --noconfirm
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
