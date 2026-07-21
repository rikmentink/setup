eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
nvm alias default node 2>/dev/null

# Postgres client
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# XML tools
export LDFLAGS="-L$(brew --prefix libxml2)/lib -L$(brew --prefix libxslt)/lib -L$(brew --prefix openssl)/lib -L$(brew --prefix zlib)/lib"
export CPPFLAGS="-I$(brew --prefix libxml2)/include -I$(brew --prefix libxslt)/include -I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include"
export LD_LIBRARY_PATH="$(brew --prefix libxml2)/lib:$(brew --prefix libxslt)/lib:$(brew --prefix openssl)/lib:$(brew --prefix zlib)/lib"