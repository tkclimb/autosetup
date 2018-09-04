if [ "$TK_PLATFORM" == "darwin" ]; then
  brew install pyenv
  brew install pyenv-virtualenv

elif [ "$TK_PLATFORM" == "linux-ubuntu" ]; then
  # pyenv
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

  # pyenv virtualenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  eval "$(pyenv virtualenv-init -)"

fi

TK_PYTHON2_VERSION=2.7.15
TK_PYTHON3_VERSION=3.6.3
pyenv install $TK_PYTHON2_VERSION
pyenv install $TK_PYTHON3_VERSION
pyenv virtualenv $TK_PYTHON2_VERSION python2
pyenv virtualenv $TK_PYTHON3_VERSION python3
pyenv global python2 python3
pyenv rehash
