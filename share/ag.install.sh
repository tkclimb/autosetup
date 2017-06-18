if [ $TK_PLATFORM == darwin ]; then
  brew install ag

elif [ $TK_PLATFORM == linux-ubuntu ]; then
  sudo apt install silversearcher-ag

fi

