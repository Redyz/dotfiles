#!/bin/bash
# ?->2020-11-29: Legacy, tbd date
# 2020-11-29: Rework
#      

git_version=$(git rev-parse --short HEAD | tail -n 1)
echo "🛠️ == [Dotfiles v$git_version] == 🛠️"

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

function info(){
  echo "-- $1"
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

function verify_dir(){
  if ! [ -e $1 ]; then
    sudo mkdir -p $1 -v
    sudo chown $USER:$USER $1
    echo "[📤] Creating symlink $1"
  else
    echo "[ ] Folder $1 already exists"
  fi;
}

function verify_ln(){
  if ! [ -e $2 ]; then
    ln -fs $1 $2
    echo "[📤] Creating symlink $1"
  elif [ -h $2 ]; then
    echo "[ ] Symlink $1 already exists"
  else
    echo "[!] File exists ($1) but is not a symlink"
    if no_prompt "Fix?"; then false;
    else
      mv $2 $2-old -v
      echo "[📤] Fixing symlink $1"
    fi;
  fi;
}

function home_ln(){
  if ! [ -z ${2+x} ]; then
    mkdir -p ~/$(dirname $2)
    verify_ln ~/Documents/git/dotfiles/$1 ~/$2
  else
    verify_ln ~/Documents/git/dotfiles/$1 ~/$(basename $1)
  fi;
}

function touch_and_create(){
  mkdir -p $(dirname $1)
  touch $1
  echo "[ ] Touching $1"
}

info "Installing packages"
./packages.sh
touch ~/.private-bashrc


info "Setting up essential dirs"
mkdir -p ~/.config/newsboat
mkdir -p ~/.config/terminator
home_ln tmux/.tmux
home_ln tmux/.tmux.conf
home_ln tmux/.tmuxsnapshot

info "Setting tmux TPM"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then 
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi;

info "Setting up Neobundle"
if [ ! -d "$HOME/.vim/bundle/neobundle.vim" ]; then 
  info "Installing Neobundle"
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install-neobundle-script-temp.sh
  sh ./install-neobundle-script-temp.sh && rm install-neobundle-script-temp.sh
else
  info "Neobundle already installed"
fi;

if [ ! -d "$HOME/.config/xfce4" ]; then 
  ln -s $PWD/xfce4 $HOME/.config/xfce4
fi


info "Setting ZSH from git"
zsh --version || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

info "Setting git properties"
git config --global user.email "Redyz"
git config --global user.name "Redyz"
verify_ln ~/.vimrc

info "Setting up home links"
home_ln .bashrc
home_ln .zshrc
home_ln .dunstrc .config/dunst/dunstrc
home_ln compton.conf .config/compton.conf
home_ln htoprc .config/htop/htoprc
home_ln i3/.i3status.conf .i3/i3status.conf
home_ln i3/config .config/i3/config
home_ln mpd/mpd.conf .mpd/mpd.conf
home_ln newsboat/config .config/newsboat/config
home_ln newsboat/urls .config/newsboat/urls
home_ln qutebrowser/keys.conf .config/qutebrowser/keys.conf
home_ln qutebrowser/qutebrowser.conf .config/qutebrowser/qutebrowser.conf
home_ln rofi .config/rofi/config
home_ln terminator/config .config/terminator/config
home_ln terminalrc .config/xfce4/terminal/terminalrc
home_ln urxvt/.Xdefaults .Xdefaults 
home_ln vim/.vimrc 
home_ln vim/after .vim/after
home_ln vim/ftplugin .vim/ftplugin
home_ln vim/ultisnips .vim/UltiSnips
home_ln surfraw .config/surfraw/conf
home_ln .ncmpcpp .ncmpcpp/config 
home_ln ranger/rc.conf .config/ranger/rc.conf

info "Setting up MPD"
touch_and_create "$HOME/.mpd/mpd.pid"
touch_and_create "$HOME/.mpd/mpd.db"
touch_and_create "$HOME/.mpd/mpdstate"
mkdir -p "$HOME/.mpd/playlists"

info "Setting up shares"
verify_dir /mnt/extra
verify_dir /mnt/extra2
verify_dir /mnt/extra3
verify_dir /mnt/extra4
verify_dir /mnt/backup-3000
verify_dir /mnt/backup-3000-mirror

info "Finalizing - running inxi"
inxi -F

info "Current dotfiles git status:"
git --no-pager diff --shortstat

echo "🕶 ==  [Done] == 🕶"
