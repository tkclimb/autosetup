#!/bin/bash

if [ "$TK_PLATFORM" == "darwin" ]; then
  # Not implemented
  :
elif [ "$TK_PLATFORM" == "linux-ubuntu" ]; then
  sudo apt install clang libclang-dev cmake pkg-config bash-completion lua

  cd /tmp
  git clone --recursive git@github.com:Andersbakken/rtags.git
  cd rtags
  mkdir build && cd build
  cmake ..
  make -j4
  sudo make install

fi
