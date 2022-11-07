
52

If you need to improve the speed for sshfs connections, try these options:

oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead

command would be:

sshfs remote:/path/to/folder local -oauto_cache,reconnect,defer_permissions

