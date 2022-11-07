BKUP_HOME_M_FOLDER=/mnt/server/mnt/4TB_a57a1e77-94d8-4cfd-bfdd-db31512b7af6/bkup/HOMES/manjaro_pc
BKUP_HOME_POP_FOLDER=/mnt/server/mnt/4TB_a57a1e77-94d8-4cfd-bfdd-db31512b7af6/bkup/HOMES/pop_pc_home
[[ -d /mnt/server/home ]] || sshfs -o  IdentityFile=/home/miksolo/.ssh/id_rsa miksolo@192.168.12.12:/ /mnt/server # || echo "Could't mount server miksolo@192.168.12.12:/ exit" && exit 1
# yay -Sc
# tar -czpvf  --exclude='/home/miksolo/nvme' --exclude='/home/miksolo/pop' --exclude='/home/miksolo/Downloads' "$BKUP_HOME_M_FOLDER/manjaro_pc_home.tar.gz" --directory /home/miksolo  -g $BKUP_HOME_M_FOLDER/diff.snar  
tar -cvpzf $BKUP_HOME_M_FOLDER/manjaro_pc_home.tar.gz --one-file-system --exclude='Downloads' /home/miksolo  | tee "$BKUP_HOME_M_FOLDER/last_bkup.log"


tar -cvpzf $BKUP_HOME_POP_FOLDER/pop_pc_home.tar.gz --one-file-system --exclude="VirtualBoxVMs" --exclude="Steam"  --exclude="torrent" --exclude="matlab" /mnt/pop_os/home/miksolo  | tee "$BKUP_HOME_POP_FOLDER/last_bkup.log"