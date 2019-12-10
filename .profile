export tabstop=8
export textwidth=80

export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$GOPATH/bin"

export MAKEFLAGS="-j$(grep -c ^processor /proc/cpuinfo)"

if [ -n "$BASH_VERSION" ]; then
	. "$HOME/.bashrc"
fi
