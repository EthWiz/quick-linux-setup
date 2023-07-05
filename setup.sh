#!/bin/bash

# Update and upgrade the system
sudo apt-get update && sudo apt-get upgrade -y

# Check if git is installed, if not, install it
if git --version > /dev/null 2>&1; then
    echo "Git is already installed"
else
    sudo apt-get install git -y
fi

# Check if zsh is installed, if not, install it
if zsh --version > /dev/null 2>&1; then
    echo "Zsh is already installed"
else
    sudo apt-get install zsh -y
fi

# Install nvm
if [ -d "$HOME/.nvm" ]; then
    echo "NVM is already installed"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi

# Source nvm
source ~/.bashrc

# Install Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh-autosuggestions
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "Zsh autosuggestions is already installed"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Add zsh-autosuggestions to the .zshrc file
if grep -q "plugins=(git zsh-autosuggestions)" "~/.zshrc"; then
    echo "Zsh autosuggestions is already in .zshrc"
else
    echo "plugins=(git zsh-autosuggestions)" >> ~/.zshrc
fi

# Source the .zshrc file to apply changes immediately
source ~/.zshrc
