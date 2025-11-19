## Homebrew apps available
eval "$(/opt/homebrew/bin/brew shellenv)"

##Init starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.dotfiles/.starship/starship.toml

## Loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

## Homebrew python
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

## Go PATH
export PATH=$PATH:$HOME/go/bin

## Case insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
export ZSHZ_CASE=smart

## Alias
alias vim="nvim"
alias ls="ls --color"
alias l="ls -la"
alias celar="clear"
alias connect-dev-env="ssh -i ~/.ssh/digitalocean root@178.128.174.2"

## No duplicate history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## syntax highlighting to zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## auto-suggestions to zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## cd tab completion highlight
bindkey '^I' expand-or-complete-prefix
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' list-colors ''

## fuzzy finder
eval "$(fzf --zsh)"


DISABLE_LAST_LOGIN=true
export LANG=en_US.UTF-8

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
