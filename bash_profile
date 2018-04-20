#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#
# Setup environment variables.
#

# Update the PATH to prefer the user bin directory.
export PATH=$HOME/bin:$PATH

# Ignore commands starting with spaces and duplicates in history.
export HISTCONTROL=ignoreboth

# Set LS_COLORS based on the configuration in ~/.dircolors.
[[ -f ~/.dircolors ]] && eval `dircolors -b ~/.dircolors`

# Automatically start X on tty1.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 2> ~/.xsession-errors
fi

# vim: set ft=sh:
