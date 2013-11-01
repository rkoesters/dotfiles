PS1='$ '
PS2='> '
PS4='+ '


# Some useful colors.
txtgrn='\e[0;32m'
txtylw='\e[0;33m'
txtwht='\e[0;37m'


# Uncomment to use a color prompt.
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
PS1="$txtgrn[\u@\h $txtylw\W$txtgrn]$txtgrn\$$txtwht "
