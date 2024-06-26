## Homebrew apps available
eval "$(/opt/homebrew/bin/brew shellenv)"

##Init starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.dotfiles/.starship/starship.toml

## Loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

## Homebrew python
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

## z jump
source $HOME/zsh-z/zsh-z.plugin.zsh

## Case insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
export ZSHZ_CASE=smart

## Alias
alias vim="nvim"
alias intellij="open -na 'IntelliJ IDEA.app'"
alias suggest="gh copilot suggest"
alias explain="gh copilot explain"
alias ls="ls --color"
alias l="ls -la"
alias celar="clear"

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

export LANG=en_US.UTF-8
