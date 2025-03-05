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
		if type "${i:?}" >/dev/null 2>&1; then
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

__ps1_plain='[${__ps1_status_code:-000}] \u@\H:\w\n\$ '
__ps1_xterm='[\[\033[0;${__ps1_status_color:-33}m\]${__ps1_status_code:-000}\[\033[0m\]] \u@\H:\w\[\033]0;${__ps1_pretty_pwd:-???}\007\]\n\$ '

PS1="${__ps1_plain:?}"
PS2='> '
PS4='+ '

__prompt_command_plain () {
	local code=$?
	printf -v __ps1_status_code '%3s' "${code:?}"
	PS1="${__ps1_plain:?}"
}

__prompt_command_xterm () {
	__prompt_command_plain
	__ps1_status_color=31
	if [ "${__ps1_status_code:?}" = "  0" ]; then
		__ps1_status_color=32
	fi
	__ps1_pretty_pwd="$(pretty_pwd)"
	PS1="${__ps1_xterm:?}"
}

__prompt_command_9term () {
	__prompt_command_plain
	type awd >/dev/null 2>&1 && awd
}

__prompt_command () {
	case "${TERM:?}" in
		xterm*|rxvt*|screen*|tmux*)
			__prompt_command_xterm
			;;
		9term|dumb)
			__prompt_command_9term
			;;
		*)
			__prompt_command_plain
			;;
	esac
}

__debug_trap_xterm () {
	# Add the running command to the xterm title.
	printf '\033]0;%s - %s\007' "${BASH_COMMAND:?}" "$(pretty_pwd)"
}

__debug_trap () {
	case "${TERM:?}" in
		xterm*|rxvt*|screen*|tmux*)
			__debug_trap_xterm
			;;
		*)
			;;
	esac
}

if [ -n "${bash_preexec_imported}" ] || [ -d "/usr/share/bash-preexec" ]; then
	preexec_functions+=(__debug_trap)
	precmd_functions+=(__prompt_command)
else
	trap '__debug_trap' DEBUG
	PROMPT_COMMAND="__prompt_command; ${PROMPT_COMMAND}"
fi

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
