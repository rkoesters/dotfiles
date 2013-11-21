# Return the first argument that exists as executable.
get_exist() {
	for i in "$@"; do
		if which "$i" >/dev/null 2>/dev/null; then
			echo "$i"
			return
		fi
	done
	return 1
}

# Find which web browser to use.
BROWSER=$(get_exist firefox chromium-browser lynx)

# Find EDITOR and PAGER.
case $termprog in
	9term|win)
		EDITOR=E
		PAGER=cat
		;;
	*)
		EDITOR=$(get_exist vim vi ed)
		PAGER=$(get_exist less more)
		;;
esac

export BROWSER EDITOR PAGER
