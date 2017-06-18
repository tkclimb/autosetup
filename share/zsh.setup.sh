if [ $TK_PLATFORM == darwin ]; then
  brew install zsh

elif [ $TK_PLATFORM == linux-ubuntu ]; then
  sudo apt install -y zsh

fi

# change default shell into zsh
chsh -s /bin/zsh
