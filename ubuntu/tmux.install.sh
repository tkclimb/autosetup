sudo apt-get install -y \
  automake \
  libevent-dev \
  libncurses5-dev \
  xsel

ghq get https://github.com/tmux/tmux.git

local tmux_repo_dir="$(ghq root)/$(ghq list tmux | head -n 1)"
cd $tmux_repo_dir

# checkout latest tag
git checkout $(git tag | sort -V | tail -n 1)

sh autogen.sh

./configure

make -j4

sudo make install
