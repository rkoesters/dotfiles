""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Configuration File

set nocompatible
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Options

set autoindent
set background=light
set formatoptions=qrn
set noexpandtab
set nowrap
set number
"set paste
set ruler
set scrolloff=2
set title


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Options that need a bit more logic

auto BufRead * let &titlestring=expand("%:p")

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
au BufRead,BufNewFile *.vala,*.vapi set filetype vala
au BufRead,BufNewFile *.go set filetype=go
