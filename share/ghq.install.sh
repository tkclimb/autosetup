if [ $TK_PLATFORM == darwin ]; then
  brew install ghq

elif [ $TK_PLATFORM == linux-ubuntu ]; then
  # ghq needs go
  sudo apt install -y golang
  export GOPATH=$HOME/go
  export PATH="$GOPATH/bin:$PATH"
  go get github.com/motemen/ghq

fi

