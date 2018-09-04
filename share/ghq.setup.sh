if [ "$TK_PLATFORM" == "darwin" ]; then
  brew install ghq

elif [ "$TK_PLATFORM" == "linux-ubuntu" ]; then
  # ghq needs go
  sudo apt install -y golang
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
  go get github.com/motemen/ghq

  ## temporary set go path to .bashrc
  tmp_bashrc=$HOME/.bashrc
  cat <<EOF > $tmp_bashrc
  export PATH=$GOPATH/bin:\$PATH
EOF

  # tk_home & ghq
  export TK_HOME=/var/tk_home
  sudo mkdir -p $TK_HOME/ghq
  sudo chown $(id -u):$(id -g) -R $TK_HOME

  ## temporary ghq root setting
  tmp_gitconfig=$HOME/.gitconfig
  cat <<EOF > $tmp_gitconfig
[ghq]
    root = $TK_HOME/ghq
EOF
fi

