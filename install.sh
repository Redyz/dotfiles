#!/bin/bash
#TODO: Patched fonts,
#			 

function verify_ln(){
	if ! [ -e $2 ]; then
		ln -fs $1 $2
		echo Creating symlink $1
	else
		echo Symlink $1 already exists
	fi;
}

function home_ln(){
	if ! [ -z ${2+x} ]; then
		mkdir -p `dirname $2`
		verify_ln ~/Documents/git/dotfiles/$1 ~/$2
	else
		verify_ln ~/Documents/git/dotfiles/$1 ~/`basename $1`
	fi;
}

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

echo "Setting git properties"
git config --global user.email "Redyz"
git config --global user.name "Redyz"

mkdir -p ~/.newsbeuter
mkdir -p ~/.config/terminator

home_ln vim/.vimrc 
home_ln tmux/.tmux
home_ln tmux/.tmux.conf
home_ln .bashrc
home_ln newsbeuter/urls .newsbeuter/urls
home_ln newsbeuter/config .newsbeuter/config
home_ln terminator/config .config/terminator/config
