#
# ~/.zprofile
#

# Update the PATH to prefer the user bin directory. Keep this in zprofile
# instead of zenv to prevent it from being overwritten by /etc/profile.
typeset -u path
path=(~/bin $path)

# Run the ssh-agent once and cache the environment variables.
pgrep -u $USER ssh-agent >/dev/null || ssh-agent > ~/.ssh-agent-env
eval "$(<~/.ssh-agent-env)" >/dev/null

# Remap the caps locks to the escape button.
setxkbmap -options caps:escape

# Automatically start X on tty1.
[[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx 2> ~/.xsession-errors

# vim: set ft=sh:
