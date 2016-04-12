#!/bin/bash
#TODO: Patched fonts,
#      

quiet_mode=false
while getopts ":q" opt; do
  case $opt in
    q)
      echo "Quiet mode"
      quiet_mode=true
      ;;
  esac
done

function important(){
  length=${#1}
  padding=$(python -c "print('='*$length)")
  echo $padding
  echo $1
  echo $padding
}

function no_prompt(){
  echo "$@ [y/N] "
  if [ "$quiet_mode" == true ] ; then echo N; return 0; fi
  read -r -p "" response
  case $response in
      [yY]) 
          return 1
          ;;
      *)
          return 0
          ;;
  esac
}

function yes_prompt(){
  echo "$@ [Y/n] "
  if [ "$quiet_mode" == true ] ; then echo Y; return 1; fi
  read -r -p "" response
  case $response in
      [nN]) 
          return 1
          ;;
      *)
          return 0
          ;;
  esac
}

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
home_ln vim/ftplugin .vim/ftplugin
home_ln vim/after .vim/after
home_ln vim/ultisnips .vim/UltiSnips
home_ln tmux/.tmux
home_ln tmux/.tmux.conf
home_ln tmux/.tmuxsnapshot
home_ln .bashrc
home_ln newsbeuter/urls .newsbeuter/urls
home_ln newsbeuter/config .newsbeuter/config
home_ln terminator/config .config/terminator/config
home_ln urxvt/.Xdefaults .Xdefaults 

important "If using KDE, import keyboard settings manually (Global Keyboard -> Kwin)"
if no_prompt "Compile YCM?"; then false;
else
  python2.7 $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer
fi;

echo Done!
