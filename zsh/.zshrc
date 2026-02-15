export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

[[ ! -d "$XDG_DATA_HOME/zsh" ]] && mkdir -p "$XDG_DATA_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' menu select

PROMPT='%K{blue}%F{white} %n %k%F{blue}%f %K{black}%F{white} %~ %k%F{black}%f '

alias vi='nvim'
alias gs='git status'
alias ll='ls -la'

bindkey -v

setopt NO_BEEP
setopt HIST_IGNORE_DUPS
