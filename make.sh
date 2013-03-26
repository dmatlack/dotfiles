#!/bin/bash

#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles # dotfiles directory
files="bashrc vimrc vim tmux.conf" # list of files/folders to symlink in homedir

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
