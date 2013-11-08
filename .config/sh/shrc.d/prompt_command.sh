case $TERM in
	xterm*|rxvt*|screen*)
		PROMPT_COMMAND='set_xterm_title "$PWD"'
		;;
	9term|dumb)
		PROMPT_COMMAND='awd'
		;;
	*)
		;;
esac
