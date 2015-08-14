export BASH_CONFIG_DIR="$HOME/.config/bash"
export GOPATH="$HOME/go"

export tabstop=8
export textwidth=72

if [ -z "$PROFILE_ALREADY_READ" ]; then
	export PATH="$HOME/bin:$PATH:$GOPATH/bin"
fi
export PROFILE_ALREADY_READ=1

if [ -n "$BASH_VERSION" ]; then
	. "$HOME/.bashrc"
fi
