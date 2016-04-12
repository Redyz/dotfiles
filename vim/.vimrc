"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved

endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'szw/vim-tags'
"NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {'build': { 'linux' : 'make'}}
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ervandew/supertab'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'rdnetto/YCM-Generator'
NeoBundle 'wesQ3/vim-windowswap'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

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

set hidden
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
set expandtab
set title
set ttymouse=xterm2
set hlsearch

"au !BufRead /tmp/mutt* source ~/.mutt/address-search.vim

"Remember last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Unite
nnoremap <space>l :Unite file_rec/async<CR>
nnoremap <space>/ :Unite grep:.<CR>
nnoremap <space>s :Unite -quick-match buffer<CR>

" ctrlp
hi Pmenu ctermfg=226
noremap <Leader>p :CtrlPBuffer<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Ctags
let g:vim_tags_auto_generate = 1

"let g:UltiSnipsExpandTrigger = "<tab>"
let g:ultisnipsjumpforwardtrigger = ""
let g:ultisnipsjumpbackwardtrigger = ""

"" YCM
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:UltiSnipsEditSplit="vertical"
