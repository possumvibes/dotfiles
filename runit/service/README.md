# runit SVDIR

Needed files:
/etc/sv/runsvdir-possum/run
~/.config/sv/<service-name>
~/service

To set up user services with runit, follow the instructions in the [Void Linux documentation](https://docs.voidlinux.org/config/services/user-services.html)

My (system) service to permit my user services is as follows:

```sh
#!/bin/sh

export USER="possum"
export HOME="/home/possum"

groups="$(id -Gn "$USER" | tr ' ' ':')"
svdir="$HOME/service"

exec chpst -u "$USER:$groups" runsvdir "$svdir"
```

The `svdir` value defined in the system service is the directory where my live user services will like (equivalent to /var/service).

I have the `SVDIR` environment variable set to `$HOME/service`, so I am able to use `sv` with just the service name:

```sh
sv status syncthing
```

User services are managed by my dotfiles and live in ~/.config/sv/. The services in my SVDIR are *not* managed by dotfiles and must be manually re-linked to enable when updating the dots.
