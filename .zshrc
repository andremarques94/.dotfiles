##Init starship
eval "$(starship init zsh)"

## Loads nvm

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

## Homebrew 
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

## Case insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


## Alias
alias vim="nvim"
alias intellij="open -na 'IntelliJ IDEA.app'"
alias suggest="gh copilot suggest"
alias explain="gh copilot explain"
alias ls="ls --color"
alias l="ls -la"

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
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## auto-suggestions to zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## cd tab completion highlight
bindkey '^I' expand-or-complete-prefix
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' list-colors ''

## fuzzy finder
eval "$(fzf --zsh)"
