#!/bin/sh

# Merge local ~/.Xresources with the defaults.
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Lenovo X1 Carbon v3 (2560 x 1440, 310mm x 174 mm)
#xrandr --dpi 192

# Dell XPS 13 9360 (1920 x 1080, 294mm x 165mm)
xrandr --dpi 96

# Start compton compositor.
compton -b

# Start the URXVT daemon
urxvtd -q -o -f

# Restore the previous nitrogen wallpaper
nitrogen --restore

# Start cinnamon screensaver and lock on suspend/hibernate
#xset s 120
#cinnamon-screensaver &
#xss-lock -v -- cinnamon-screensaver-command -l &

exec i3
