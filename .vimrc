""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Configuration File

set nocompatible
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Options

set autoindent
set background=dark
set backup
set formatoptions=qrn
set noexpandtab
set nowrap
set scrolloff=2
set spell
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
""" Directories

set backupdir=$XDG_CACHE_HOME/vim
set directory=$XDG_CACHE_HOME/vim
set runtimepath^=$XDG_CONFIG_HOME/vim
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntax

syntax on
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala


