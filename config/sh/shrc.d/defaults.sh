# Check if the executable exists.
check_exist () {
	which "$@" >/dev/null 2>/dev/null
	return $?
}

# Find which web browser to use.
#if check_exist chromium-browser
#then
#	BROWSER=chromium-browser
#else
#	BROWSER=firefox
#fi
BROWSER=firefox

# Find EDITOR and PAGER.
case $termprog in
	9term|win)
		PAGER=cat
		EDITOR=E
		;;
	*)
		# Find the text editor.
		if check_exist vim
		then
			EDITOR=vim
		elif check_exist vi
		then
			EDITOR=vi
		else
			EDITOR=ed
		fi

		# Find the pager.
		if check_exist less
		then
			PAGER=less
		else
			PAGER=more
		fi
		;;
esac

export BROWSER EDITOR PAGER
