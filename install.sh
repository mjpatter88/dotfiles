#!/bin/bash
#########################
# install.sh
# This script sets up my work environment on a linux machine.
# At this point it assumes you have git (and vim) already installed.
# 
# It was heavily inspired by the work of Michael Smalley.
# 
# See: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#########################

######### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc gvimrc" # add files to this line as needed

#########


# create the directory to hold the old dot files
echo -n "Creating $olddir for existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Move old files and create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh()
{
    # Test to see if zshell is installed. If it is:
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Clone the oh-my-zsh repository from Github if it isn't already present
        if [[ ! -d $dir/oh-my-zsh/ ]]; then
            echo "Cloning oh-my-zsh ..."
            git clone http://github.com/robbyrussell/oh-my-zsh.git
            echo "done"
        fi
        # Set the dfault shell to zsh if it isn't already
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            echo "Setting default shell to zsh"
            chsh -s $(which zsh)
            echo "done"
        fi
    else
        # If zsh isn't installed, install it and then run this function again
        echo "Installing zsh..."
        sudo apt-get install zsh
        install_zsh
        echo "done"
    fi
}

install_zsh
