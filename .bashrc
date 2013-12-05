[ -z "$PS1" ] && return

if [ -d "$BASH_CONFIG_DIR/bashrc.d" ]; then
	for i in "$BASH_CONFIG_DIR/bashrc.d"/*.sh; do
		. "$i"
	done
fi
