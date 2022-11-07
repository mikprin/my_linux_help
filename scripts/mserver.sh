
NCS_DIR=/mnt/ncs # Выбираю место куда смонтируется сервер
NCS_ROOT=/mnt/ncs_root
sudo mkdir -p $NCS_DIR # Создаю эту папку (если ее нет)
sudo chmod 777 $NCS_DIR # Делаю ее общей
#sudo mkdir -p $NCS_ROOT # Создаю эту папку (если ее нет)
#sudo chmod 777 $NCS_ROOT # Делаю ее общей

sshfs -o IdentityFile=~/.ssh/id_rsa solovyanov_m@ncs-design.mipt.ru:/home/solovyanov_m $NCS_DIR # Монтирую
#sudo chmod 777 $NCS_DIR
#sshfs -o IdentityFile=~/.ssh/id_rsa solovyanov_m@ncs-design.mipt.ru:/ $NCS_ROOT # Монтирую
