HOSTNAME="`hostname | sed 's/\..*$//'`"
LC_COLLATE="C"
USER="`whoami`"
tabstop="8"
textwidth=72

export HOSTNAME LC_COLLATE USER tabstop textwidth
