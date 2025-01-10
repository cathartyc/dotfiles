#!/bin/bash

# Create a TAR archive, given the name of the archive (.tar is automatically
# added) and the folder that contains the file to add to it. 
# It avoids the unpleasant fact of adding the parent folder to the archive.
#
# Example:
#   tar-ez myarchive path/to/dir
#
tar-ez() {
    find "$2" \( -type f -o -type d \) -printf "%P\n" | tar -cvf "$1" --no-recursion -C "$2" -T -
}

# Show files with detailed info and include hidden ones
alias la="ls -la"
# Manage the dotfiles repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME'
