#!/bin/bash
#########################
# install_windows.ps1
# This script sets up my work environment on a windows machine.
# It assumes you can execute powershell scripts (.ps1).
# At this point it assumes you have git (and vim) already installed.
#
# It basically does the same thing as "install_linux.sh" but for windows.
#
# Powershell may prevent this script from running. To fix, run this command:
# set-executionpolicy remotesigned
#
# For more info, run this command:
# Get-Help about_signing
#########################

######### Variables

$dir = "~/dotfiles"
$olddir = "~/dotfiles_old"
$files = ("vimrc ideavimrc") # add files to this line as needed (gvimrc zshrc oh-my-zsh) etc

#########

# create the directory to hold the old dot files if it doesn't exist
Write-Host "Creating $olddir for existing dotfiles in ~ ..."
If (Test-Path $olddir)
{
    Write-Host "$olddir already exists. Unable to backup files. Aborting..."
    Exit
}
Else
{
    mkdir -p $olddir
}
Write-Host "done"

# change to the dotfiles directory
Write-Host "Changing to the $dir directory ..."
cd $dir
Write-Host "done"

# Move old files and create symlinks
Write-Host "Moving old files and creating symlinks to new files."
Foreach($file in $files)
{
    If (Test-Path ~/.$file)
    {
        mv ~/.$file $olddir/
    }
    # The following command is run on cmd.exe not powershell,
    # so we must use windows-style file paths, environment vars, etc.
    cmd /C mklink %HOMEPATH%\.$file %HOMEPATH%\dotfiles\$file
}
Write-Host "done"
