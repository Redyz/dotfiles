set nu
if &term =~ '^screen'
" tmux will send xterm-style keys when its xterm-keys option is on
 execute "set <xUp>=\e[1;*A"
 execute "set <xDown>=\e[1;*B"
 execute "set <xRight>=\e[1;*C"
 execute "set <xLeft>=\e[1;*D"
endif 
set expandtab
set tabstop=2
call pathogen#incubate()
call pathogen#helptags() 
" set compatible to false
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

map <silent> <F5> :call gruvbox#bg_toggle()<CR>
imap <silent> <F5> <ESC>:call gruvbox#bg_toggle()<CR>a
vmap <silent> <F5> <ESC>:call gruvbox#bg_toggle()<CR>gv

set t_Co=256
syntax on
"colorscheme SolarizedDark_modified
colorscheme lucius 
LuciusDark
let g:lucius_contrast = "low"
map <silent> <F3> :Rex<CR>
vmap <leader>cc :s/^/#/<cr>
vmap <leader>co :s/^#//<cr>
nnoremap <silent> <C-W>t :tabnew<CR> 
