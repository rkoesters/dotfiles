export BASH_CONFIG_DIR="$HOME/.config/bash"
export GOPATH="$HOME/go"
export PLAN9=/opt/plan9port

export tabstop=8
export textwidth=72

if [ -z "$PROFILE_ALREADY_READ" ]; then
	export PATH="$HOME/bin:$PATH:$GOPATH/bin"

	if [ -n "$DISPLAY" ]; then
		9 plumber
	fi
fi
export PROFILE_ALREADY_READ=1

if [ "$PS1" ]; then
	. "$HOME/.bashrc"
fi
