set nocompatible

" Vim Plugin
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Neobundle settings
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'moll/vim-node';

" neocomplete
let g:neocomplete_enable_at_startup = 1

" edit settings
filetype plugin indent on
filetype indent on
syntax on
set encoding=utf-8
set backspace=2
set novisualbell
set history=1000
set mouse=a
set whichwrap+=h,l,<,>,[,],b,s	" good for cursor key!

" file settings
set hidden
set confirm
set autoread
set nobackup
set noswapfile

" search settings
set ignorecase	" mutch uppwe and lower
set smartcase	" upper pertern search, ignore lower string
set incsearch	" incremental
set hlsearch	" highlight
set wrapscan	" return top
nmap <ESC><ESC> :noh<CR>	" cancel highlight

" visual Settings
set number
set ruler
set showmatch
set matchtime=3
set list
set listchars=eol:[,tab:>\ 
set t_Co=256
"colorscheme hybrid
set ambiwidth=double
set lazyredraw
set cursorline

" TAB settings
set tabstop=2		"showTAB space
set shiftwidth=2	"autoIndent shift width
set smartindent
set autoindent
set smarttab

"
" status line
"
set showcmd
set laststatus=2
set statusline=[%n]
set statusline+=[%{matchstr(hostname(),'\\w\\+')}@]
set statusline+=[%<%F]
set statusline+=%m
set statusline+=%r
set statusline+=%L
set statusline+=%=
set statusline+=%y
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
set statusline+=[line:%l/%L(%p%%),col:%c]

"
"Programing
"

" completion
" (auto completion, target:pinpoint keyword)
"set completeopt=menuone
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"  exec "imap " . k . " " . k . "<C-N><C-P>"
"endfor
"imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

" (completion, target:dict, like Intellisense)
"imap <Nul> <C-x><C-o>

" bracket completeion
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>

" keyword highlight with [ignorecase], [smartcase]
set infercase

" highlight FULL-PITCH space
highlight  DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
augroup highlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,Colorscheme * match DoubleByteSpace /　/
  autocmd VimEnter,WinEnter,BufRead * match DoubleByteSpace /　/
augroup END

" TAB and split navigation
nmap <C-S-Right> :tabnext<CR>
nmap <C-S-Left> :tabprevious<CR>
"nmap <C-t> :tabnew<CR>
nmap <C-w>w :q<CR>

" PHP programing support
autocmd FileType php set dictionary=~/.vim/dict/php.dict
" (when you save php file, check syntax error)
" autocmd BuFWritePost *.php silent make | if len(getqflist()) != 1 ~ copent | else | cclose | endif

" Javascript programing support
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
"set g:node_usejscomplete = 1


" CSS support
autocmd filetype css set dictionary=~/.vim/dict/css.dict
