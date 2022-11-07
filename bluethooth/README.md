https://askubuntu.com/questions/486347/bluetooth-mouse-not-auto-reconnecting-to-laptop


https://techwiser.com/fix-bluetooth-device-doesnt-auto-connect-in-linux/



It works on Ubuntu 17.10 I think every distro with bluetoothctl is supported:

    Run in terminal `bluetoothctl` In $bluetooth command line type devices. You will see list of available devices.
    Type trust 00:XX:XX:XX:XX:XX Where number started with 00: is a divice you wish to connect.
    Type ctrl+d or quit to exit.

    If You want to automatically connect Your device on startup, open Startup Applications and add new one.
        Press Add
        Name launcher like My startup BT connection
        In command type bash -c 'echo -e "connect 00:XX:XX:XX:XX:XX \nquit" | bluetoothctl'

You can also setup a keyboard shortcut with same command to lunch, and connect You device with press of a button.

Have fun :)