# Docker completions
fpath=(/Users/rikmentink/.docker/completions $fpath)
autoload -Uz compinit
compinit

# History
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY HIST_IGNORE_DUPS