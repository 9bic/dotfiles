"
" by platform
"
if has("win32") || has("win64")
  source $VIMRUNTIME/delmenu.vim
  set langmenu=en_US.utf-8
  source $VIMRUNTIME/menu.vim
endif

" if has('unix')
"   let s:userdir = expand('~/.vim')
"   let s:install_plugin = 0
"   set ttimeout
"   set ttimeoutlen=10
"   " status line (without lightline)
"   set showcmd
"   set statusline=[%n]
"   set statusline+=[%{matchstr(hostname(),'\\w\\+')}@]
"   set statusline+=[%<%F]
"   set statusline+=%m
"   set statusline+=%r
"   set statusline+=%L
"   set statusline+=%=
"   set statusline+=%y
"   set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"   set statusline+=[line:%l/%L(%p%%),col:%c]
" endif

if has('mac') || has('unix')
  let s:userdir = expand('~/.vim')
  let s:install_plugin = 1
  set imdisable
  let s:undodir = s:userdir . "/undo"
  let &undodir = s:undodir

  " unite grep with ag
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif

  " if focus gained, ime make disable
  if executable('osascript')
    let s:keycode_jis_eisuu = 102
    let g:force_alphanumeric_input_command = "osascript -e 'tell application \"System Events\" to key code " . s:keycode_jis_eisuu . "' &"
    inoremap <silent> <Esc> <Esc>:call system(g:force_alphanumeric_input_command)<CR>
    autocmd! FocusGained * call system(g:force_alphanumeric_input_command)
  endif
endif

if has('gui')
  source $RC_DIR/gui.vim
endif

" edit settings
filetype off
filetype plugin indent off
set encoding=utf-8
set backspace=2
set novisualbell
set noerrorbells
set mouse=a
set whichwrap+=h,l,<,>,[,],b,s	" good for cursor key!
set nowrap
set termguicolors

augroup colorSet
  autocmd!
augroup END

" file settings
set hidden
set confirm
set autoread
set nobackup
set noswapfile

" search settings
set ignorecase	" mutch uppwe and lower
set smartcase	" upper pertern search, ignore lower string
set infercase
set incsearch	" incremental
set hlsearch	" highlight
set wrapscan	" return top
noremap <ESC><ESC> :noh<CR>	

" command settings
set wildmenu
try
  set wildignorecase
  set wildmode=list:full
endtry
set nowrap
set history=1000

"
" visual settings
"
set number
set ruler
set showmatch
set matchtime=3
set list
set laststatus=2
" tab/eol chars
try
  set listchars=tab:>\ ,extends:»,eol:«
catch
  set listchars=tab:>/ ,extends:>>,eol:<
endtry

set t_Co=256
set ambiwidth=double
set lazyredraw
set scrolloff=5
set cursorline

" TAB settings
set tabstop=2		"showTAB space
set shiftwidth=2	"autoIndent shift width
set smartindent
set autoindent
set smarttab
set expandtab


" IME support
set iminsert=0
set imsearch=0

" split(open right, under)
set splitright
set splitbelow

" wordjumping
inoremap <C-Left> B
inoremap <C-Right> W
nnoremap <C-Left> B
nnoremap <C-Right> W

" ';' command start
noremap ; :
"
"Programing
"
filetype plugin indent on
" switch filetype
augroup vimrc_filetype
    autocmd!
    autocmd FileType javascript setlocal sw=2 ts=2
    autocmd FileType xml        setlocal sw=2 ts=2
    autocmd FileType html       setlocal sw=2 ts=2
    autocmd FileType vim        setlocal sw=2 ts=2
    autocmd FileType text       setlocal sw=4 ts=4
    autocmd FileType sh         setlocal sw=2 ts=2
    autocmd FileType css        setlocal sw=4 ts=4
    autocmd FileType php        setlocal sw=4 ts=4
    autocmd FileType python     setlocal sw=4 ts=4
    autocmd FileType json       setlocal sw=2 ts=2
    autocmd FileType swift      setlocal sw=4 ts=4
    autocmd FileType yaml       setlocal sw=2 ts=2 sts=2 expandtab indentkeys-=<:>
augroup END

" highlight FULL-PITCH space
highlight  DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
augroup highlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,Colorscheme * match DoubleByteSpace /　/
  autocmd VimEnter,WinEnter,BufRead * match DoubleByteSpace /　/
augroup END

" TAB and split navigation
noremap <S-l> :tabnext<CR>
noremap <S-h> :tabprevious<CR>

" neovim shell integratin
if has('nvim')
  set sh=bash
  tnoremap <silent> <ESC> <C-\><C-n>
  noremap <SPACE>t :15sp<CR>:terminal<CR>``
  tnoremap <C-w> <C-\><C-n><C-w>
endif

let g:deoplete#enable_at_startup = 1


