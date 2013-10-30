_tree () {
	if [ -t 1 ]
	then
		command tree -C "$@"
	else
		command tree "$@"
	fi
}
