" Mostly use nvim so fairly basic 
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" List your plugins here
Plugin 'jelera/Vim-javascript-syntax'
Plugin 'tpope/vim-sensible'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
Plugin 'itchyny/lightline.vim'

call vundle#end()

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material 

set number
set relativenumber
autocmd InsertLeave * write

set hlsearch

set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

set ignorecase

set shell=/bin/zsh

" Move lines up and down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

if (has('termguicolors'))
  set termguicolors
endif
