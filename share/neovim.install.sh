if [ $TK_PLATFORM == darwin ]; then
  brew tap neovim/neovim
  brew install neovim

elif [ $TK_PLATFORM == linux-ubuntu ]; then
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim

fi

