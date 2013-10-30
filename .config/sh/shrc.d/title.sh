# Override the xterm window title.
set_xterm_title () {
	printf '\033]0;%s\007' "$@"
}
