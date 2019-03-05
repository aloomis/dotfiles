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

# Activate the screen saver (dim the screen) after 120 seconds of inactivity and
# the screen locker after the first burn in cycle (another 60 seconds).
xset s 120 60
xss-lock -n dim-screen.sh -- i3lock-wrapper.sh &

# Disabled standby and suspend. Turn the screen off after 150 seconds of
# inactivity. On an LCD there is not much difference between the three.
xset dpms 0 0 150

# Remap the caps locks to the escape button.
setxkbmap -option caps:escape

exec i3
