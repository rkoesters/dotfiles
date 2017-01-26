export tabstop=4
export textwidth=72

export GOPATH="$HOME/go"
export PATH="$HOME/bin:$PATH:$GOPATH/bin"

if [ -n "$BASH_VERSION" ]; then
	. "$HOME/.bashrc"
fi
