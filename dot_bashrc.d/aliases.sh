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
alias ls="ls --color=auto"
alias la="ls -la"
alias grep="grep --color=auto"
alias ll="ls -l"
alias la="ls -lA"

# Git shortcuts
alias gs="git status"
alias gc="git commit"
alias gp="git pull"
alias gd="git diff"

# Edit dotfiles
dotnvim() {
    if [[ $# -ge 1 ]]; then
        chezmoi edit --watch "$@"
    else
        echo "Cannot watch the whole directory." >&2
    fi
}
