#!/bin/bash

# Add 64-bit libraries path
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH

# Initialize the ssh-agent
eval "$(ssh-agent -s)" > /dev/null

# My acutal prompt decorator
eval "$(starship init bash)"

# Github cli
eval "$(gh completion -s bash)"

# Rust commands
. "$HOME/.cargo/env"

# Use Neovim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Node version manager stuff
NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR

# Perl stuff
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PERL_MM_OPT

# Keep history short by removing duplicates
export HISTCONTROL=ignoreboth:erasedups

# VS Code ahh trick to sign git commits
GPG_TTY=$(tty)
export GPG_TTY

