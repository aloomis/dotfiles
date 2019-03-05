#
# ~/.zshrc
#

#
# Setup environment variables.
#

# Set LS_COLORS based on the configuration in ~/.dircolors.
[[ -f ~/.dircolors ]] && eval `dircolors -b ~/.dircolors`

# Set the default editor to be neovim.
export VISUAL=nvim
export EDITOR=$VISUAL

# Increase the default command history.
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history

# Prevent writing duplicate entries to the history file. Alternatively,
# HIST_FIND_NO_DUPS could be used to ignore duplicates while searching the
# history.
setopt HIST_IGNORE_ALL_DUPS

# Enable vi mode in ZLE.
bindkey -v

# Reduce time to wait for multi-character sequences to 0.1 seconds. This speeds
# up ZLE vi mode transitions significantly.
export KEYTIMEOUT=1

# Enable incremental search key-bindings.
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward

# Begin searches with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search

# Load additional dotfiles.
[[ -f $ZDOTDIR/.zprompt ]] && . $ZDOTDIR/.zprompt
[[ -f $ZDOTDIR/.zbell ]] && . $ZDOTDIR/.zbell
[[ -f $ZDOTDIR/.zfuzz ]] && . $ZDOTDIR/.zfuzz

#
# Setup aliases.
#

# Enable indicators, human readable sizes, and color by default.
alias ls="ls -Fh --color=auto"
alias ll="ls -alFh --color=auto"

# Enable color by default.
alias grep="grep --color"

# Always use neovim.
alias vim=nvim

# vim: set ft=sh:
