#!/bin/bash
guake -e "tmux -2" &
xpad -sN &
dunst -config $HOME/Documents/scripts/dunst &
#wmname LG3D
xbindkeys &
setxkbmap -layout "us,ca" -option grp:ctrl_alt_toggle
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
/usr/lib/kdeconnectd &
exec /usr/bin/i3


virtualbox --startvm NEON --fullscreen
