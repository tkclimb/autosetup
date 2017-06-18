if [ $TK_PLATFORM == darwin ]; then
  brew install rbenv

elif [ $TK_PLATFORM == linux-ubuntu ]; then
  #rbenv
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  export RBENV_ROOT="$HOME/.rbenv"
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"

  # ruby-build
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

fi

TK_RUBY_VERSION=2.3.4
rbenv install $TK_RUBY_VERSION
rbenv global $TK_RUBY_VERSION
rbenv rehash
