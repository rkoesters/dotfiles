case "$termprog" in
	9term|win)
		alias ls='ls -F'
		;;
	*)
		alias ls='ls -p --color=auto'
		alias tree='_tree'
		;;
esac

# I never use openvt, would rather have open point to xdg-open.
alias open="xdg-open"

# Send a notification about the previous command.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo utilities-terminal || echo dialog-error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
