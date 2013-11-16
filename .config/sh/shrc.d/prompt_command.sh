# Runs before every prompt.
prompt_command () {
	case $TERM in
		xterm*|rxvt*|st*|screen*)
			set_xterm_title "$(pwd)"
			;;
		9term|dumb)
			# We will get an error if we ever actually use a
			# dumb terminal, but I think it is safe to assume
			# that it is Acme or 9term.
			awd
			;;
		*)
			;;
	esac
}

PROMPT_COMMAND="prompt_command"
