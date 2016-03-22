"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/reightb/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/reightb/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'ervandew/supertab'
NeoBundle 'szw/vim-tags'
"NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'fatih/vim-go'
NeoBundle 'mileszs/ack.vim'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on
colorscheme busierbee 
"colorscheme zenburn 

inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>
inoremap <C-u> <esc>gUiwea
nnoremap ; :
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <C-W>t :tabnew<CR> 
nnoremap <space> za
nnoremap A<esc> <nop>

"Escape clears search
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

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

nmap <Leader><Leader>W <Plug>(easymotion-b)

set backspace=indent,eol,start
set laststatus=2 "Force 2 lines status
set matchtime=2
set mouse=a
set nocp
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=2
set smartindent
set t_Co=256
set tabstop=2
set title
set ttymouse=xterm2
set hlsearch


"Remember last position
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ctrlp
hi Pmenu ctermfg=226
noremap <Leader>p :CtrlPBuffer<CR>

" Buffers are tabs
let g:airline#extensions#tabline#enabled = 1

" Ctags
let g:vim_tags_auto_generate = 1

" ack
let g:ackprg = "ack -i --column"
"let g:ack_default_options = " -i --column"

"runtime plugin/supertab.vim
