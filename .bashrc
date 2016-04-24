# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export LD_LIBRARY_PATH=${HOME}/bin/libevent/lib/:${LD_LIBRARY_PATH}
export PATH=${HOME}/bin/tmux/bin:${PATH}:/home/reightb/Documents/scripts
export MANPATH=${HOME}/bin/tmux/share/man:${MANPATH}

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

shopt -s checkwinsize
shopt -s expand_aliases

alias urxvt='urxvt -e bash -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME"'
alias tmux='tmux -2'

export EDITOR=vim
export PS1="[\[$(tput sgr0)\]\[\033[38;5;245m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;46m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\[\033[38;5;154m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export TERM=screen-256color
export TERMINAL=terminator
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PROMPT_DIRTRIM=2
export TERMINAL=terminator

ddp () {
 sudo kill -USR1 $(pgrep ^dd)
}

no () { 
  [ -f ~/T/$1.v ] && vim ~/T/$1.v || ls ~/T;
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

ydl() {
 youtube-dl "$1" -o - | mpv -
}

min() {
  fbterm; TERM=fbterm tmux -2
}

fixtabs(){
  find . -type d -name ".git" -prune -o -type f  -exec sh -c 'expand -t 2 {} > {}tmp; mv {}tmp {}' \;
}

ttop() {
  watch "ps aux | sort -rk 3,3 | head -n 6"
}

dolphin() {
  DESKTOP_SESSION=kde /usr/bin/dolphin 
  notify-send "DANK MEMES"
}

source ~/.private-bashrc

QT_QPA_PLATFORMTHEME=kde

PATH="/home/reightb/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/reightb/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/reightb/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/reightb/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/reightb/perl5"; export PERL_MM_OPT;
