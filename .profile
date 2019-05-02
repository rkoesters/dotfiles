export tabstop=8
export textwidth=80

export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH:$GOPATH/bin"

if [ -n "$BASH_VERSION" ]; then
	. "$HOME/.bashrc"
fi
