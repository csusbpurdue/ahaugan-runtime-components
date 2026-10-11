# Add cs240/bin to PATH
export PATH=$PATH:~cs240/bin

# Basic aliases to have common ls commands and add colors
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"

# Strip permissions from group and others when creating new files
umask 077

export PATH=$PATH:~cs240/bin # init240

alias gdb='gdb -q'          # skip the gdb license banner
alias ..='cd ..'
alias grep='grep --color=auto'

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------
export EDITOR=vim           # editor used by programs that need one
export PAGER=less

# Put your own scripts in ~/bin and run them from anywhere.
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# boilersay
export PATH="$HOME/.local/bin:$PATH"
alias boilersay='cowsay -f train'
alias hail='printf "Hammer Up\nBoiler Down\nHail Purdue\n" | boilersay -n'
