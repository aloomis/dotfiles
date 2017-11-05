#!/bin/sh

# Lenovo X1 Carbon v3 (2560 x 1440, 310mm x 174 mm)
xrandr --dpi 192

# Start compton compositor.
compton -b

# Start the URXVT daemon
urxvtd -q -o -f

# Restore the previous nitrogen wallpaper
nitrogen --restore

# Start cinnamon screensaver and lock on suspend/hibernate
xset s 120
cinnamon-screensaver &
xss-lock -- cinnamon-screensaver-command -l &

# Setup environment variables
export PATH=$HOME/bin:$PATH

exec i3
