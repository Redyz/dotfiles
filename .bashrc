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
#export TERM="xterm-256color"
