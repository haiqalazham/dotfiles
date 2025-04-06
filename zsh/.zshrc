source /usr/local/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

alias ls="ls --color"

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or 'OA'
bindkey '^[[B' history-substring-search-down # or 'OB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

setopt globdots
