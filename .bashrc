[ -z "${PS1}" ] && return

# ------------------------------------------------------------------------------
# IMPORTS
# ------------------------------------------------------------------------------

# Command completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi

# ------------------------------------------------------------------------------
# GLOBAL OPTIONS
# ------------------------------------------------------------------------------

export LC_COLLATE=C

# When set, git uses dialog boxes for passwords. Don't want that.
unset GIT_ASKPASS
unset SSH_ASKPASS

# I always use ^D to exit the shell, so it better work.
set +o ignoreeof
# I use > to overwrite files all the time.
set +o noclobber
# Update LINES and COLUMNS after every command.
shopt -s checkwinsize

# ------------------------------------------------------------------------------
# FUNCTIONS
# ------------------------------------------------------------------------------

# Return the first argument that exists as executable.
get_exist() {
	for i in "$@"; do
		if type "${i:?}" >/dev/null 2>/dev/null; then
			echo "${i:?}"
			return
		fi
	done
	return 1
}

# Print the given command in a way that mimics `set -x` and then run said
# command. This is used for long running operations during shell startup so the
# user knows what is causing a possible delay.
print_and_run() {
	echo "${PS4:?}$*"
	"$@"
}

# Like pwd except replace home directory path with `~`.
pretty_pwd() {
	dirs +0
}

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------

case "${termprog}" in
	9term|win)
		alias diff='diff -u'
		alias ls='ls -F'
		;;
	*)
		alias diff='diff -u --color=auto'
		alias ls='ls -h -p --color=auto'

		alias grep='grep --color=auto'
		alias egrep='egrep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias rgrep='rgrep --color=auto'
		;;
esac

alias df='df -h'
alias du='du -h'

alias open="${HOME:?}/bin/open"

# Send a notification about the previous command.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo utilities-terminal || echo dialog-error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Change directory to the root of a git repo.
alias gitd='cd $(git rev-parse --show-toplevel)'

# ------------------------------------------------------------------------------
# DEFAULT PROGRAMS
# ------------------------------------------------------------------------------

# Find which web browser to use.
export BROWSER=$(get_exist google-chrome chromium-browser firefox lynx)

# Find EDITOR and PAGER.
case "${termprog}" in
	9term|win)
		export EDITOR=E
		export PAGER=cat
		;;
	*)
		export EDITOR=$(get_exist vim vi ed)
		export PAGER=$(get_exist less more)
		;;
esac

# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------

PS1='[${__ps1_exit_code:-000}] \u@\h:\w\033]0;\w\007\n$ '
PS2='> '
PS4='+ '

__prompt_command_xterm () {
	local code=$?
	local color=31
	if [ "${code:?}" = "0" ]; then
		color=32
	fi
	printf -v __ps1_exit_code '\033[0;%sm%3s\033[0m' "${color:?}" "${code:?}"
}

__debug_trap_xterm () {
	# Add the running command to the xterm title.
	printf '\033]0;%s\007' "${BASH_COMMAND:?} - $(pretty_pwd)"
}

case "${TERM:?}" in
	xterm*|rxvt*|screen*|tmux*)
		case "${PROMPT_COMMAND}" in
			__prompt_command_xterm*)
				;;
			*)
				PROMPT_COMMAND="__prompt_command_xterm; ${PROMPT_COMMAND}"
				;;
		esac
		trap '__debug_trap_xterm' DEBUG
		;;
	9term|dumb)
		PROMPT_COMMAND='awd'
		;;
	*)
		;;
esac

# ------------------------------------------------------------------------------
# MOTD
# ------------------------------------------------------------------------------

# Keep everything that should run every time an interactive shell session begins
# above this section.

if [ -n "${BASHRC_MOTD_ALREADY_SHOWN}" ]; then
	return
fi
BASHRC_MOTD_ALREADY_SHOWN=1
export BASHRC_MOTD_ALREADY_SHOWN

if type fortune >/dev/null 2>&1; then
	fortune -n 500 -s |
	if type cowsay >/dev/null 2>&1; then
		cowsay -f tux
	else
		cat
	fi
fi

print_and_run context
