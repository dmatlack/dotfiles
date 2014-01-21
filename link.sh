#!/bin/bash

set -e

dir="$HOME/dotfiles"

# These files should be added for all my computers
files="bashrc vimrc vim tmux.conf irssi gitconfig 
       Xdefaults Xmodmap xbindkeysrc i3"

##########

(
  echo -n "Changing to the $dir directory ... "
  cd $dir
  echo "done"
  
  for file in $files; do
    rm -f ~/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
  done
)
