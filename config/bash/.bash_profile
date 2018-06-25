#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#
# Setup environment variables.
#

# Update the PATH to prefer the user bin directory.
export PATH=$HOME/bin:$PATH

# Set the default editor.
export VISUAL=nvim

# Automatically start X on tty1.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 2> ~/.xsession-errors
fi

# vim: set ft=sh:
