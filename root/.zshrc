# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="amuse"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Docker completions
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then compinit; else compinit -C; fi

# History
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY HIST_IGNORE_DUPS
