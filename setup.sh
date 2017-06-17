export TK_AUTOSETUP_ROOT="$(cd "$(dirname $1)" && pwd)"

# Set TK_PLATFORM
case ${OSTYPE} in
    darwin*)
      export TK_PLATFORM=darwin
      ;;
    linux*)
      export TK_PLATFORM=linux
      ;;
esac

if [[ $TK_PLATFORM == darwin ]]; then
  source osx/setup.sh
elif [[ $TK_PLATFORM == linux ]]; then
  source linux/setup.sh
fi


# python
TK_PYTHON2_VERSION=2.7.13
TK_PYTHON3_VERSION=3.5.3
pyenv install $TK_PYTHON2_VERSION
pyenv install $TK_PYTHON3_VERSION
pyenv virtualenv $TK_PYTHON2_VERSION python2
pyenv virtualenv $TK_PYTHON3_VERSION python3
pyenv global python2 python3
pyenv rehash


# TK_RUBY_VERSION=2.3.1
# rbenv install $TK_RUBY_VERSION
# rbenv global $TK_RUBY_VERSION
# rbenv rehash


# change default shell
chsh -s /bin/zsh


# set symlink at home
# ln -sf `ghq root`/`ghq list autosetup`/Brewfile
ghq get https://github.com/tkclimb/autosetup.git
echo "Setup done!! Please remove this directory."
