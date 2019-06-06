# set env
AS_ROOT_DIR="$(cd $(dirname \"$1\")/.. && pwd)"
AS_PLATFORM="$OSTYPE"

# initialize
if [[ "$AS_PLATFORM" == "linux-gnu" ]]; then
  # sudo apt update -y
  # sudo apt upgrade -y

  if [ ! -e /home/linuxbrew/.linuxbrew ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  fi

elif [[ "$AS_PLATFORM" == "darwin"* ]]; then
  sudo softwareupdate --install --recommended
  xcode-select --install

  if [ ! -e /usr/local/Homebrew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

else; then
  exit
fi

# install basic packages
if [[ "$AS_PLATFORM" == "linux-gnu" ]]; then
  sudo apt install -y \
    ssh \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    exfat-fuse \
    exfat-utils \

  brew bundle --file=./Brewfile.ubuntu

elif [[ "$AS_PLATFORM" == "darwin"* ]]; then
  brew bundle --file=./Brewfile.macos
fi


echo "Setup done!!"

