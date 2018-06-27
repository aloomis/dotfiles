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
