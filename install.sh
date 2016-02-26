#!/bin/bash
echo "Dotfiles install script"
touch ~/.private-bashrc

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then 
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi;

if [ ! -d "$HOME/.vim/bundle/neobundle.vim" ]; then 
	echo "Installing Neobundle"
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install-neobundle-script-temp.sh
	sh ./install-neobundle-script-temp.sh && rm install-neobundle-script-temp.sh
else
	echo "Neobundle already installed"
fi;
