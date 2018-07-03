#
# ~/.zshrc
#

#
# Setup environment variables.
#

[[ -f $ZDOTDIR/.zsh_prompt ]] && . $ZDOTDIR/.zsh_prompt

# Set LS_COLORS based on the configuration in ~/.dircolors.
[[ -f ~/.dircolors ]] && eval `dircolors -b ~/.dircolors`

# Set the default editor to be neovim.
export VISUAL=nvim
export EDITOR=$VISUAL

# Increase the default command history.
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history

# Ignore duplicates when searching the history.
# Alternatively, HIST_IGNORE_ALL_DUPS could be used to prevent writing duplicate
# entries to the history file.
setopt HIST_FIND_NO_DUPS

# Reduce time to wait for multi-character sequences to 0.2 seconds.
export KEYTIMEOUT=2

# Enable vim mode in ZLE.
bindkey -v

# Enable vim search keybindings in command mode.
bindkey -M vicmd "/" vi-history-search-forward
bindkey -M vicmd "?" vi-history-search-backward
bindkey -M vicmd "n" vi-repeat-search
bindkey -M vicmd "N" vi-rev-repeat-search

#
# Setup aliases.
#

# Enable indicators, human readable sizes, and color by default.
alias ls="ls -Fh --color=auto"
alias ll="ls -Fhl --color=auto"

# Enable color by default.
alias grep="grep --color"

# Always use neovim.
alias vim=nvim

# vim: set ft=sh:
