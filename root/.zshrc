# Docker completions
fpath=(/Users/rikmentink/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Aliases
alias docker-up='docker compose -f ~/.docker-projects/docker-compose.yml up -d'
alias docker-down='docker compose -f ~/.docker-projects/docker-compose.yml down'
alias docker-logs='docker compose -f ~/.docker-projects/docker-compose.yml logs -f'
alias psql-connect='psql -h localhost -U postgres'
alias odoo-start='odoo -c ~/.odoorc'

# Functions
pkill() { ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9 2>/dev/null; }
docker-clean() { docker system prune -a --volumes -f; }

# History
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY HIST_IGNORE_DUPS