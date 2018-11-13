#!/bin/sh
if [ ! -z "$PANTHEON_TERMINAL_ID" ]; then
	prefer_dark_style="$(dconf read /io/elementary/terminal/settings/prefer-dark-style)"

	if [ "$prefer_dark_style" = "false" ]; then
		echo "light"
	else
		echo "dark"
	fi
else
	# idk, guess something
	echo "dark"
fi
