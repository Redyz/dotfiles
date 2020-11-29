# Fix USB screen
xinput --map-to-output "wch.cn USB2IIC_CTP_CONTROL" HDMI-1 > /dev/null 2>&1 

base_git="$HOME/Documents/git"
cat $base_git/notes/tips | shuf | head -n 1

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/Documents/Scripts
export ZSH="/home/reightb/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
cap()(cd /tmp;rm -f -- *.vtt;youtube-dl --skip-download --write-auto-sub -- "$1";sed '1,/^$/d' -- *.vtt|sed 's/<[^>]*>//g'|awk -F. 'NR%8==1{printf"%s ",$1}NR%8==3')

tmux -2
