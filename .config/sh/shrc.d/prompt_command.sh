# Runs before every prompt.
prompt_command () {
	case $TERM in
		xterm*|rxvt*|st*|screen*)
			set_xterm_title "$(get_title_string)"
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

# Get string used for terminal title.
get_title_string () {
	#pwd=$(pwd | sed "s#$HOME#~#")
	#
	#echo "$USER@$HOSTNAME:$pwd"
	pwd
}

PROMPT_COMMAND="prompt_command"
