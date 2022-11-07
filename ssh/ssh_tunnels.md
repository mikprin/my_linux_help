
Using SSH Tunnelling to Access a Local Network Remotely
Wednesday, 6 January 10, 7:08 pm
First set up the tunnel like so:
ssh -D 8080 -N REMOTEUSER@REMOTEHOST
You can also add the -f switch to make this run in the background. What this does is to forward connections to port 8080 on the local machine to the remote server over SSH (i.e. encrypted).

Once it's active, you can configure applications to use the tunnel by setting up a SOCKS 4 or 5 proxy for them.

In Firefox, go to Edit > Preferences, then choose the Network tab on the Advanced subpage. Click the Settings.. button at the top next to Configure how Firefox connects to the Internet.

Select Manual proxy configuration, and enter localhost in the SOCKS Host textbox, and 8080 for the port. This will now send connections through your SSH tunnel. If you want, you can also use the DNS server at the remote location by entering about:config into Firefox's address bar, and toggling the network.proxy.socks_remote_dns setting to true.

You can configure Pidgin in a similar way. It lets you use different proxy settings for each account. Go to Accounts > Manage Accounts, select the account you want to change and click the Modify.. button. From there, choose the Proxy tab, and select SOCKS 4 or SOCKS 5 in the Proxy Type dropdown at the top. Enter a host of localhost, and a port of 8080, and you're good to go.
Mounting a Remote Location with SSHFS
This is well cool. With SSHFS, you can access remote drives as if they were a folder on your local filesystem. Once you've installed SSHFS, you'll need to add yourself to the fuse group:
sudo gpasswd -a $USER fuse
You'll then need to log out and back in again in order to apply the changes to your session. Next mount the remote folder like so:
sshfs -o idmap=user REMOTEUSER@REMOTEHOST:REMOTEFOLDER LOCALFOLDER
This works fine if you are connecting to a location on the remote host directly, if however you need to mount a drive on a host that is only accessible through a gateway machine, you need something else.

If you find you are unable to access the folder after mounting as above, getting an Input/output error, unmount the folder, and try again but this time add a trailing slash to the end of the REMOTEFOLDER name.
Mounting a Remote Location with SSHFS through a gateway
First of all, set up a tunnel to your remote host through the gateway:
ssh -L2222:TARGET-MACHINE:22 REMOTEUSER@GATEWAY-MACHINE
This will set up a tunnel starting on port 2222 on your local machine and ending at port 22 (ssh) on the remote machine. Now you can mount with SSHFS through the tunnel:
sshfs rdeeson@127.0.0.1:/home/workspaces/remotemount /home/rdeeson/localmount/ -o port=2222
