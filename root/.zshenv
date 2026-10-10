export PATH="$HOME/bin:$PATH"

# Pyenv: shims on PATH, no init/rehash per shell
export PYENV_ROOT="$HOME/.pyenv"
path=($PYENV_ROOT/shims $PYENV_ROOT/bin $path)

# Node: highest installed version on PATH, nvm itself loads on first use
export NVM_DIR="$HOME/.nvm"
() {
  setopt local_options numeric_glob_sort
  local -a bin=( $NVM_DIR/versions/node/v*/bin(N[-1]) )
  (( $#bin )) && path=($bin $path)
}
nvm() {
  unfunction nvm
  . /opt/homebrew/opt/nvm/nvm.sh --no-use
  nvm "$@"
}

# Postgres client
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# XML/build flags: static paths, no brew calls
_o=/opt/homebrew/opt
export LDFLAGS="-L$_o/libxml2/lib -L$_o/libxslt/lib -L$_o/openssl@3/lib -L$_o/zlib/lib"
export CPPFLAGS="-I$_o/libxml2/include -I$_o/libxslt/include -I$_o/openssl@3/include -I$_o/zlib/include"
unset _o

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS EXTENDED_HISTORY
