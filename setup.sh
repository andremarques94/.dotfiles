#!/bin/bash

DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

command_exists(){
	command -v "$1" &> /dev/null
}

if ! command_exists brew; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Brew is already installed"
fi

BREWFILE="$DOTFILES_DIR/Brewfile"
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

src_paths=(
    "$DOTFILES_DIR/zed/settings.json"
    "$DOTFILES_DIR/.zshrc"
    "$DOTFILES_DIR/.gitconfig"
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

ITERM_SETTINGS_DIR="$DOTFILES_DIR/iterm2"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$ITERM_SETTINGS_DIR"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "All tasks completed."
