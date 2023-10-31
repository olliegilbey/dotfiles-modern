#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# Create some default dir's
mkdir -p /usr/local/
#mkdir /usr/local/homebrew_temp
#mkdir $HOME/.go
#
# Execute bootstrap
echo "bootstrapping dotfiles symlinks"
sh bootstrap.sh

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
	echo "Homebrew is already installed."
else
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Execute brew installations
echo "running brew.sh script for brew packages"
sh brew.sh

# Set default shell
echo "Setting default shell to zsh"
chsh -s $(which zsh)

# Check if Oh My Zsh is already installed
if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "Oh My Zsh is already installed."
else
	# Install Oh My Zsh
	echo "Installing Oh My Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

	# Restore the symlinked .zshrc
	if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
		echo "Restoring the symlinked .zshrc"
		rm "$HOME/.zshrc"
		mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"
	else
		echo "No pre-Oh My Zsh .zshrc backup found."
	fi
fi

# Clone zsh plugins
echo "Cloning zsh plugins"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

sh language_installs.sh
