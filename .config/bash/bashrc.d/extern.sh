# Terminal title
if [ -f /etc/profile.d/vte.sh ]; then
	. /etc/profile.d/vte.sh
fi

# Command completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi
