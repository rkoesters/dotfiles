export BASH_CONFIG_DIR="$HOME/.config/bash"

export GOPATH="$HOME/go"
export PLAN9="/opt/plan9port"
export PATH="$HOME/bin:$PATH:$GOPATH/bin"

export tabstop="8"
export textwidth="72"

if [ -n "$DISPLAY" ]; then
	9 plumber
fi

if [ "$PS1" ]; then
	. "$HOME/.bashrc"
fi
