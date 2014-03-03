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

set t_Co=256
syntax on
colorscheme lucius 
LuciusDark
let g:lucius_contrast = "low"
map <silent> <F3> :Rex<CR>
vmap <leader>cc :s/^/#/<cr>
vmap <leader>co :s/^#//<cr>
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
