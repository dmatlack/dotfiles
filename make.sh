#!/bin/bash

dir=~/.dotfiles # dotfiles directory

# These files should be added for all my computers
files="bashrc vimrc vim tmux.conf"

# Files specific to crunchbang install
if [ `hostname` = crunchbang ]; then
  files="$files conkyrc Xdefaults"
fi

##########

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create sy
#mlinks from the homedir to any files in the ~/dotfiles directory specified in $f# iles
for file in $files; do
  rm ~/.$file
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
