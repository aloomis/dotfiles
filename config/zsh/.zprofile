#
# ~/.zprofile
#

# Update the PATH to prefer the user bin directory. Keep this in zprofile
# instead of zenv to prevent it from being overwritten by /etc/profile.
typeset -u path
path=(~/bin $path)

# Automatically start X on tty1.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 2> ~/.xsession-errors
fi

# vim: set ft=sh:
