# update
sudo softwareupdate --install --recommended

# xcode
xcode-select --install

# homebrew
if [ -e /usr/local/Homebrew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


# brew bundle
brew bundle

# finish
ghq get git@github.com:tkclimb/autosetup.git
mv `pwd`

