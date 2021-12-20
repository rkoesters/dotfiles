export tabstop=4
export textwidth=80

export GOPATH="${HOME:?}"
export PATH="${PATH:?}:${HOME:?}/bin:${HOME:?}/.local/bin"

export MAKEFLAGS="-j$(grep -c ^processor /proc/cpuinfo)"

if [ -n "${BASH_VERSION}" ]; then
	# Unset BASHRC_MOTD_ALREADY_SHOWN here so that the MOTD commands are
	# executed in every login shell. The logic being that every login shell
	# would read .profile (this file).
	unset BASHRC_MOTD_ALREADY_SHOWN

	. "${HOME:?}/.bashrc"
fi
