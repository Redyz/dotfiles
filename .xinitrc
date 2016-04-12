#!/bin/bash
guake -e "tmux -2" &
xpad -s &
dunst -config $HOME/Documents/scripts/dunst &
wmname LG3D
xbindkeys &
setxkbmap -layout "us,ca" -option grp:ctrl_alt_toggle
$HOME/Documents/scripts/laptop-scripts/dwm-script &
$HOME/Documents/git/dwm/dwm
