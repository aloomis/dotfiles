#
# ~/.bashrc
#

# Exit if not running interactively.
[[ $- != *i* ]] && return

#
# Setup shell options.
#

# Update LINES and COLUMNS after each command.
[[ $DISPLAY ]] && shopt -s checkwinsize >/dev/null 2>&1

# Attempt to correct the spelling of arguments to cd.
shopt -s cdspell >/dev/null 2>&1

# Append to the history file when the shell exits.
shopt -s histappend >/dev/null 2>&1

# Enable case-insensitive filename expansion.
shopt -s nocaseglob >/dev/null 2>&1

#
# Setup environment variables.
#

# Setup the command prompt.
export PS1='[\u@\h:\W]\$ '

#
# Setup aliases.
#

# Enable indicators, human readable sizes, and color by default.
alias ls="ls -Fh --color=auto"
alias ll="ls -Fhl --color=auto"

# Enable color by default.
alias grep="grep --color"

# vim: set ft=sh:
