# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

source /usr/share/git/git-prompt.sh

export LD_LIBRARY_PATH=${HOME}/bin/libevent/lib/:${LD_LIBRARY_PATH}
export PATH=${HOME}/bin/tmux/bin:${PATH}:${HOME}/Documents/scripts
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
alias ayy='echo lmao'
export EDITOR=vim

# http://jakemccrary.com/blog/2015/05/03/put-the-last-commands-run-time-in-your-bash-prompt/
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

show_length(){
	if [ "0$timer_show" -gt "20" ]; then
		h=`expr $timer_show / 3600`
    m=`expr $timer_show  % 3600 / 60`
    s=`expr $timer_show % 60`
		printf "[\e[90m"
		if [ "$h" -ne "0" ]; then printf "%02dh%02dm%02ds" $h $m $s;
		elif [ "$m" -ne "0" ]; then printf "%02dm%02ds" $m $s;
		else [ "$h" -ne "0" ]; printf "%02ds" $s; fi
		printf "$white]"
	fi;
}

get_username(){
  if [ "$USER" != "reightb" ]; then
    printf "$USER$white@";
  else
    printf "";
    # Don't display anything
  fi;
}

# Unstyled colors
red="$(echo -e "\e[31m")"
green="$(echo -e "\e[32m")"
yellow="$(echo -e "\e[93m")"
white="$(echo -e "\e[97m")"
trap 'timer_start' DEBUG
if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi

#trap 'timer_start' DEBUG
#if [ "$PROMPT_COMMAND" == "" ]; then
  #PROMPT_COMMAND="timer_stop"
#else
  #PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
#fi
export PS1='\[$(show_length)\]\[\e[92m\]$(get_username)\[$white\]\[\e[$(echo ${#HOSTNAME} % 6 + 30 | bc)m\]\h \[$white\]\w $(__git_ps1 "\[\e[90m\](%s) ")\[$white\]'
#export PS1='\[$(show_length)\]\[\e[92m\]$(get_username)\[$white\]\[\e[$(echo ${#HOSTNAME} % 6 + 30 | bc)m\]\h \[$white\]\w \[$white\]'
export GIT_PS1_SHOWDIRTYSTATE=1
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PROMPT_DIRTRIM=2
export TERM=screen-256color
export TERMINAL=xfce4-terminal

ddp () {
 watch sudo kill -USR1 $(pgrep ^dd)
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

quteproxy() {
  qutebrowser -s network proxy "socks://localhost:8080"
}

mkback() {
  name=`basename $1`
  cd `dirname $1`
  if [ -f "$name.back" ]; then
    echo "Overwriting $name.back"
  else
    echo "Creating backup $name.back"
  fi;
  cp "$name" "$name.back"
}

notes() {
  vim -c "RecentNotes"
}

man_python() {
   python -c "import $1; help($1)"
}

current_term=$(ps -p $(ps -p $$ -o ppid=) o args=)
if [[ "$current_term" == "urxvt" ]]; then
  if [[ "$TMUX" == "" ]]; then
    exec tmux -2
  fi
fi

alias urxvt="urxvt -e tmux"

source ~/.private-bashrc

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=kde

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
source /usr/share/autojump/autojump.bash
QT_QPA_PLATFORMTHEME=kde

#PROMPT_COMMAND='history -a'export PROMPT_COMMAND='history -a'

#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

to_ogg()
{
  directory=$(dirname $1)
  name=$(basename $1)
  extension="${name##*.}"
  filename="${name%.*}"
  to_extension=$2
  ffmpeg -i $1 $directory/$filename.$to_extension;
}

kra_remove()
{
  find . -name "*.kra*" -type f -delete
}
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
