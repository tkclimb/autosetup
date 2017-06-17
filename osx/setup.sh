# update
sudo softwareupdate --install --recommended

# xcode
xcode-select --install

# homebrew
if [ -e /usr/local/Homebrew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


# brew bundle
brew bundle --file=$TK_AUTOSETUP_ROOT/osx/Brewfile
