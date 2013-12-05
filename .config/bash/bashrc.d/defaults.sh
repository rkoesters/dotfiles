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
export BROWSER=$(get_exist firefox chromium-browser lynx)

# Find EDITOR and PAGER.
case $termprog in
	9term|win)
		export EDITOR=E
		export PAGER=cat
		;;
	*)
		export EDITOR=$(get_exist vim vi ed)
		export PAGER=$(get_exist less more)
		;;
esac
