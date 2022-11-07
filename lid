To disable the Lid Switch:

    Open the file /etc/systemd/logind.conf as root.

    Find this: HandleLidSwitch

    If it's commented, uncomment and change the value to ignore. The line after editing should be:

    HandleLidSwitch=ignore

    Restart computer and your problem should be gone. Or better restart logind service:

    sudo service systemd-logind restart

    https://unix.stackexchange.com/questions/200125/debian-8-jessie-laptop-stops-working-after-closing-the-laptop-lid

