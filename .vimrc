set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" List your plugins here
Plugin 'jelera/Vim-javascript-syntax'
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
Plugin 'itchyny/lightline.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'pangloss/vim-javascript'

call vundle#end()

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material 

set number
set relativenumber
" autocmd InsertEnter * :set relativenumber
" autocmd InsertLeave * :set norelativenumber
autocmd InsertLeave * write

set timeoutlen=500

set hlsearch


set shiftwidth=0
set tabstop=4
autocmd Filetype jsx setlocal tabstop=2

set autoindent
set smartindent

set ignorecase

set shell=/bin/zsh

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Move lines up and down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" Movement in insert and command mode
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
" cnoremap <C-h> <Left>
" cnoremap <C-j> <Down>
" cnoremap <C-k> <Up>
" cnoremap <C-l> <Right>

noremap <C-c> <Esc>
noremap! <C-c> <Esc>


" Disable arrow keys !!!!
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" noremap! <Up> <Nop> 
" noremap! <Down> <Nop>
" noremap! <Left> <Nop>
" noremap! <Right> <Nop>

if (has('termguicolors'))
  set termguicolors
endif
