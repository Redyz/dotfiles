set nu
set directory=$HOME/.vim/swapfiles/
call pathogen#incubate()
call pathogen#helptags() 
" Doodle
set nocp 
filetype plugin on

no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
no <down> <Nop>

ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>

nmap j jzz
nmap h hzz
nmap k kzz
nmap l lzz
nnoremap } }zz
nnoremap { {zz

set t_Co=256
syntax on
colorscheme lucius 
LuciusDark
let g:lucius_contrast = "low"
map <silent> <F3> :Rex<CR>
nnoremap <silent> <C-W>t :tabnew<CR> 
set autoindent
set cindent
set smartindent
set shiftwidth=2
set expandtab
hi MatchParen cterm=none ctermbg=none ctermfg=white
set softtabstop=2

nnoremap / /\v
vnoremap / /\v

nnoremap n nzzzv
nnoremap N Nzzzv

noremap H ^
noremap L g_

nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea
"File completion
inoremap <C-f> <C-x><C-f>
"Line completion
inoremap <C-l> <C-x><C-l>
"Don't use A<esc>, force yourself into using L
nnoremap A<esc> <nop>
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"use the system clipboard by default
set clipboard=unnamed
set mouse=a
