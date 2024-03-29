""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Configuration File

set nocompatible
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Options

set formatoptions=cjnqr
set nowrap
set number
set ruler
set scrolloff=2
set colorcolumn=+1
set title
set nofoldenable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Options that need a bit more logic

auto BufEnter * let &titlestring="vim " . expand("%") . " - " . substitute(getcwd(), $HOME, '~', '')

set expandtab
set tabstop=8
if exists("$tabstop")
	let &shiftwidth=$tabstop
	let &softtabstop=$tabstop
endif

if exists("$textwidth")
	let &textwidth=$textwidth
endif

if exists("$TMUX")
	set background=dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Backup

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntax

filetype plugin on
syntax on
