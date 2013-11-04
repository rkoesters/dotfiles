export ENV="$HOME/.config/sh/shrc"
export GOPATH="$HOME/go"
export PLAN9="/opt/plan9port"
export PATH="$HOME/bin:$PATH:$GOPATH/bin"

# Let's make bash behave in a posix manner.
export POSIXLY_CORRECT=1

# XDG
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# VIM
export MYVIMRC=$XDG_CONFIG_HOME/vim/vimrc

if [ -n "$DISPLAY" ]; then
	9 plumber
fi
