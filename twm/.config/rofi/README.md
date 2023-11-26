# Handy Rofi Commands
because I always forget!

### Desktop app picker:

```sh
rofi -show drun -modi run,drun,window
```

this will launch the desktop app picker, drawing from desktop programs, non-desktop programs, and open windows. Honestly unsure if the multiple modi make a meaningful difference!

### Runner

```sh
rofi -show run
```

this will launch the app picker *not* based on desktop entries.


### Window picker
```sh
rofi -show window
```

Shows all open windows (across workspaces, if defined in wm)


### Combine 'em all!

```sh
rofi -show combi combi-modes 'window,drun,run'
```

Opens a combined picker that starts with open windows, then desktop entries, and fills from those as well as executable names. This one rules.
