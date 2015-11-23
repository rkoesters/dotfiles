[ -z "$PS1" ] && return

# ----------------------------------------------------------------------
# IMPORTS
# ----------------------------------------------------------------------

# Command completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi

# ----------------------------------------------------------------------
# GLOBAL OPTIONS
# ----------------------------------------------------------------------

export LC_COLLATE=C

# When set, git uses dialog boxes for passwords. Don't want that.
unset GIT_ASKPASS
unset SSH_ASKPASS

# ----------------------------------------------------------------------
# FUNCTIONS
# ----------------------------------------------------------------------

# Return the first argument that exists as executable.
get_exist() {
	for i in "$@"; do
		if which "$i" >/dev/null 2>/dev/null; then
			echo "$i"
			return
		fi
	done
	return 1
}

# Override the xterm window title.
set_xterm_title () {
	printf '\033]0;%s\007' "$@"
}

# ----------------------------------------------------------------------
# ALIASES
# ----------------------------------------------------------------------

case "$termprog" in
	9term|win)
		alias ls='ls -F'
		;;
	*)
		alias ls='ls -p --color=auto'
		;;
esac

# Send a notification about the previous command.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo utilities-terminal || echo dialog-error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ----------------------------------------------------------------------
# DEFAULT PROGRAMS
# ----------------------------------------------------------------------

# Find which web browser to use.
export BROWSER=$(get_exist google-chrome chromium-browser firefox lynx)

# Find EDITOR and PAGER.
case "$termprog" in
	9term|win)
		export EDITOR=E
		export PAGER=cat
		;;
	*)
		export EDITOR=$(get_exist vim vi ed)
		export PAGER=$(get_exist less more)
		;;
esac

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

PS1='$ '
PS2='> '
PS4='+ '

case "$TERM" in
	xterm*|rxvt*|screen*)
		PROMPT_COMMAND='set_xterm_title "$PWD"'
		;;
	9term|dumb)
		PROMPT_COMMAND='awd'
		;;
	*)
		;;
esac

# ----------------------------------------------------------------------
# MOTD
# ----------------------------------------------------------------------

fortune -s | cowsay
