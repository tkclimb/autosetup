# set env
export TK_PLATFORM=darwin
export TK_AUTOSETUP_ROOT="$(cd "$(dirname $1)/.." && pwd)"

# update
sudo softwareupdate --install --recommended

# xcode
xcode-select --install

# homebrew
if [ ! -e /usr/local/Homebrew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew bundle
brew bundle --file=./Brewfile


source $TK_AUTOSETUP_ROOT/share/pyenv.setup.sh
source $TK_AUTOSETUP_ROOT/share/rbenv.setup.sh
source $TK_AUTOSETUP_ROOT/share/ag.setup.sh


echo "Setup done!! Please remove autosetup."
