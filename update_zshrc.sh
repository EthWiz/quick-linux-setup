#!/bin/zsh

# Add the following lines to the .zshrc file
echo "
# Load command history
autoload -Uz history

# Enable command history
setopt hist_ignore_all_dups  # Ignore duplicated commands history list
setopt share_history         # Share command history data

# Enable auto-suggestion based on command history
autoload -Uz compinit
compinit
" >> ~/.zshrc

# Source the .zshrc file to apply changes immediately
source ~/.zshrc

