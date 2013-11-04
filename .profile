export ENV="$HOME/.config/sh/shrc"
export GOPATH="$HOME/go"
export PLAN9="/opt/plan9port"
export PATH="$HOME/.local/bin:$PATH:$GOPATH/bin"

# Let's make bash behave in a posix manner.
export POSIXLY_CORRECT=1

if [ -n "$DISPLAY" ]; then
	9 plumber
fi
