#!/bin/bash

dir="$HOME/.dotfiles"

# These files should be added for all my computers
files="bashrc vimrc vim tmux.conf irssi gitconfig"

# Files specific to crunchbang install
if [ `hostname` = crunchbang ]; then
  files="$files conkyrc Xdefaults Xmodmap xbindkeysrc"
fi

##########

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
  rm ~/.$file
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
