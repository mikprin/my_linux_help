Save custom keyboard shortcuts

You can save/backup/export custom shortcuts/keybindings using just dconf and sed
Export

`dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > custom-shortcuts.conf # Export`

The difference with the usual answer is that this will hold on the file the path to the dconf settings, making easier to import, just dconf load / < file.
Import

`dconf load / < custom-shortcuts.conf # Import`
