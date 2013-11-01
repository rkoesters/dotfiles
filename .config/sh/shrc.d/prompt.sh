PS1='$ '
PS2='> '
PS4='+ '

if [ x"$BASH_VERSION" = x"" ]; then
	PS1='$(prompt_command)$ '
else
	PROMPT_COMMAND="prompt_command"
fi
