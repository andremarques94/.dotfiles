#!/bin/bash

command_exists(){
	command -v "$1" &> /dev/null
}

if ! command_exists brew; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Brew is already installed"
fi

# Install brew packages
BREWFILE=~/.dotfiles/Brewfile

if [ -f "$BREWFILE" ]; then
	if !brew bundle check --file="$BREWFILE" &> /dev/null; then
		echo "Running brewfile..."
		brew bundle --file="$BREWFILE"
	else
		echo "Brewfile already up to date."
	fi
else
	echo "Brewfile not found at $BREWFILE."
fi

# Set up symlinks
src_paths=(
    "$HOME/.dotfiles/zed/settings.json"
    "$HOME/.dotfiles/.zshrc"
    "$HOME/.dotfiles/.gitconfig"
)

dest_paths=(
    "$HOME/.config/zed/settings.json"
    "$HOME/.zshrc"
    "$HOME/.gitconfig"
)

for i in "${!src_paths[@]}"; do
    src="${src_paths[$i]}"
    dest="${dest_paths[$i]}"
    if [ ! -L "$dest" ]; then
        echo "Creating symlink: $src -> $dest"
        ln -s "$src" "$dest"
    else
        echo "Symlink already exists: $dest"
    fi
done

echo "All tasks completed."
