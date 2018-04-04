# Source system bashrc
test -r /etc/bashrc && . /etc/bashrc

# Setup shell options
shopt -s cdspell >/dev/null 2>&1
shopt -s histappend >/dev/null 2>&1
shopt -s nocaseglob >/dev/null 2>&1

# Add bin to path
test -d $HOME/bin && PATH=$HOME/bin:$PATH
export PATH

# Remove duplicates from history
export HISTCONTROL=ignoreboth

# Setup the command prompt
GIT_PROMPT=$HOME/.git-prompt.sh
if [ -r $GIT_PROMPT ]; then
    . $GIT_PROMPT
    PS1="\u@\h:\W\$(__git_ps1 '(%s)')$ "
else
    PS1="\u@\h:\W$ "
fi
export PS1

# Setup terminal colors
case $(uname) in
    Darwin)
        export CLICOLOR=1
        export LSCOLORS=exfxcxdxbxahahbxbxaeae
        alias ls="ls -Fh"
        alias ll="ls -Fhl"
        alias grep="grep --color"
    ;;
    Linux)
        export LS_COLORS="di=34:ln=35:so=36:pi=33:ex=31:bd=90;47:cd=90;47:su=31:sg=31:tw=90;44:ow=90;44"
        alias ls="ls -Fh --color=auto"
        alias ll="ls -Fhl --color=auto"
        alias grep="grep --color"
    ;;
esac
