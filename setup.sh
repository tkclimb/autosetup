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

# python
PYTHON2_VERSION=2.7.12
PYTHON3_VERSION=3.5.2
pyenv install $PYTHON2_VERSION
pyenv install $PYTHON3_VERSION
pyenv global $PYTHON2_VERSION $PYTHON3_VERSION
pyenv rehash


RUBY_VERSION=2.3.1
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash

# remove cache
ghq get http://github.com:tkclimb/autosetup.git
rm -rf `pwd`

# set symlink at home
ln -sf `ghq root`/`ghq list autosetup`/Brewfile
