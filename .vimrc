""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Configuration File

set nocompatible
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Options

set background=dark
set formatoptions=qrn
set noexpandtab
set wrap
set number
set ruler
set scrolloff=2
set title
set nofoldenable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Options that need a bit more logic

auto BufEnter * let &titlestring=getcwd() . " - vim - " . expand("%")

if exists("$tabstop")
	let &tabstop=$tabstop
endif

if exists("$textwidth")
	let &textwidth=$textwidth
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Backup

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntax

filetype plugin on
syntax on
