call pathogen#infect()
call pathogen#helptags() 
filetype plugin on

set t_Co=256
syntax on
colorscheme lucius 
LuciusDark
let g:lucius_contrast = "low"
map <silent> <F3> :Rex<CR>

inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>
inoremap <C-u> <esc>gUiwea
nnoremap ; :
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-u> gUiw
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <C-W>t :tabnew<CR> 
nnoremap <space> za
nnoremap A<esc> <nop>
nnoremap N Nzzzv
nnoremap n nzzzv
noremap H ^
noremap L g_
vnoremap <space> zf

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

hi MatchParen cterm=none ctermbg=none ctermfg=white
set autoindent
set backspace=indent,eol,start
set cindent
set expandtab
set foldmethod=indent
set matchtime=2
set mouse=a
set nocp 
set noswapfile
set nowrap
set nu
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set shiftwidth=2
set smartindent
set softtabstop=2
set title
set ttymouse=xterm2
