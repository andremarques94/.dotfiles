# .dotfiles
config files 


- zsh
- spaceship
- zsh autosuggestions && syntax highlight
- iterm2 minimal colors

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Run the Brewfile
brew bundle --file ~/.dotfiles/Brewfile

## Add the symlinks
ln -s ~/.dotfiles/zed/settings.json ~/.config/zed/settings.json
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

