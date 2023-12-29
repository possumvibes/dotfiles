this file can't be stowed--xdg-user-dirs-update recreates it with every change. Copy it in the once, then run `xdg-user-dirs-update`, and if you make changes to your default dirs down the line, be sure to backport them here for your future self.

```sh
mkdir -p $HOME/Desktop $HOME/tmp $HOME/documents $HOME/pictures $HOME/audio/video
```
