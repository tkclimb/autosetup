#!/bin/bash

if [ "$TK_PLATFORM" == "darwin" ]; then
  brew install ripgrep

elif [ "$TK_PLATFORM" == "linux-ubuntu" ]; then
  version=0.5.2
  package_name="ripgrep-${version}-x86_64-unknown-linux-musl"

  cd /tmp
  wget https://github.com/BurntSushi/ripgrep/releases/download/$version/$package_name.tar.gz
  tar -xvf $package_name.tar.gz

  cd $package_name
  sudo mv rg /usr/local/bin

fi
