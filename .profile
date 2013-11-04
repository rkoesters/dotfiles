export ENV="$HOME/.config/sh/shrc"
export GOPATH="$HOME/go"
export PLAN9="/opt/plan9port"
export PATH="$HOME/.local/bin:$PATH:$GOPATH/bin"

if [ -n "$DISPLAY" ]; then
	9 plumber
fi

if [ x"$BASH_VERSION" != x"" ]; then
	set -o posix
fi
