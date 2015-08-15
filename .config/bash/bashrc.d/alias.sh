case "$termprog" in
	9term|win)
		alias ls='ls -F'
		;;
	*)
		alias ls='ls -p --color=auto'
		alias tree='_tree'
		;;
esac
alias open="xdg-open"
