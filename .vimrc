""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Configuration File

set nocompatible
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Options

set autoindent
set background=dark
set formatoptions=tcqrn
set noexpandtab
set nowrap
set scrolloff=2
set spell
set title


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Options that need a bit more logic

if exists("+colorcolumn")
	set colorcolumn=+1
endif

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

syntax on
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala


