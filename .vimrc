set nocompatible
set encoding=utf8

" General settings.
set autoindent
set background=dark
set colorcolumn=+1
set formatoptions=tcqrn
set noexpandtab
set nowrap
set scrolloff=2
set spell
set title

" These options use environmental variables.
let &tabstop=$tabstop
let &textwidth=$textwidth

" Backup.
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Syntax
syntax on
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala
