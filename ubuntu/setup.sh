# set env
export TK_PLATFORM=linux-ubuntu
export TK_AUTOSETUP_ROOT="$(cd "$(dirname $1)/.." && pwd)"

sudo apt update -y

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


source $TK_AUTOSETUP_ROOT/share/pyenv.setup.sh
source $TK_AUTOSETUP_ROOT/share/rbenv.setup.sh
source $TK_AUTOSETUP_ROOT/share/ag.setup.sh


echo "Setup done!! Please remove autosetup."

