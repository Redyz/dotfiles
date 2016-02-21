# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export LD_LIBRARY_PATH=${HOME}/bin/libevent/lib/:${LD_LIBRARY_PATH}
export PATH=${HOME}/bin/tmux/bin:${PATH}
export MANPATH=${HOME}/bin/tmux/share/man:${MANPATH}
# In order to work with 256 colors

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ll='ls -lF'
    alias la='ls -A'
    alias l='ls -CF'
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias tmux='tmux -2'
export EDITOR=vim
export PS1="[\[$(tput sgr0)\]\[\033[38;5;245m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;46m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\[\033[38;5;154m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export TERM=screen-256color
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

ddp () {
 sudo kill -USR1 $(pgrep ^dd)
}

no () { 
  [ -f ~/T/$1.v ] && vim ~/T/$1.v || ls ~/T;
}

startxx () {
  startx /home/reightb/Documents/git/dwm/dwm -- -dpi 85
  /home/reightb/Documents/scripts/laptop-scripts/dwm-script &
}

ttop () {
  ps auxk-pcpu | head -n 10
}

clock () {
 sudo ntpdate pool.ntp.org
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

fix() {
	reset
	source ~/.bashrc
}
source ~/.private-bashrc

