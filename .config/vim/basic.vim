"
" by platform
"
if has("win32") || has("win64")
  source $VIMRUNTIME/delmenu.vim
  set langmenu=en_US.utf-8
  source $VIMRUNTIME/menu.vim
endif

if has('mac') || has('unix')
  let s:userdir = expand('~/.vim')
  let s:install_plugin = 1
  set imdisable
  let s:undodir = s:userdir . "/undo"
  let &undodir = s:undodir

  " if focus gained, ime make disable
  "if executable('osascript')
  "  let s:keycode_jis_eisuu = 102
  "  let g:force_alphanumeric_input_command = "osascript -e 'tell application \"System Events\" to key code " . s:keycode_jis_eisuu . "' &"
  "  inoremap <silent> <Esc> <Esc>:call system(g:force_alphanumeric_input_command)<CR>
  "  autocmd! FocusGained * call system(g:force_alphanumeric_input_command)
  "endif
endif

if has('gui')
  source $RC_DIR/gui.vim
endif

" edit settings
filetype off
filetype plugin indent off
set showcmd
set encoding=utf-8
set backspace=2
set novisualbell
set noerrorbells
set mouse=a
set whichwrap+=h,l,<,>,[,],b,s	" good for cursor key!
set nowrap
set timeoutlen=250
set updatetime=100
set pastetoggle=<C-P>

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

" remap leader
nnoremap <SPACE> <Nop>
let mapleader = " "

" Terminal
tnoremap <C-w><Space> <C-\><C-n>
augroup TermOpen
  autocmd! *
  autocmd TerminalWinOpen * :set nonumber
augroup END
if has('mac')
  " scrollable terminal
  " https://github.com/vim/vim/issues/2490#issuecomment-711439094
  " 最後の<CR>が足りてないので足す
  let s:term_pos = {} " { bufnr: [winheight, n visible lines] }

  function! EnterTerminalNormalMode()
      if &buftype != 'terminal' || mode('') != 't'
          return 0
      endif
      call feedkeys("\<LeftMouse>\<c-w>N", "x")
      let s:term_pos[bufnr()] = [winheight(winnr()), line('$') - line('w0')]
      call feedkeys("\<ScrollWheelUp>")
  endfunction

  function! ExitTerminalNormalModeIfBottom()
      if &buftype != 'terminal' || !(mode('') == 'n' || mode('') == 'v')
          return 0
      endif
      let term_pos = s:term_pos[bufnr()]
      let vis_lines = line('$') - line('w0')
      let vis_empty = winheight(winnr()) - vis_lines
      " if size has only expanded, match visible lines on entry
      if term_pos[1] <= winheight(winnr())
          let req_vis = min([winheight(winnr()), term_pos[1]])
          if vis_lines <= req_vis | call feedkeys("i", "x") | endif
      " if size has shrunk, match visible empty lines on entry
      else
          let req_vis_empty = term_pos[0] - term_pos[1]
          let req_vis_empty = min([winheight(winnr()), req_vis_empty])
          if vis_empty >= req_vis_empty | call feedkeys("i", "x") | endif
      endif
  endfunction

  " scrolling up enters normal mode in terminal window, scrolling back to
  " the cursor's location upon entry resumes terminal mode. only limitation
  " is that terminal window must have focus before you can scroll to
  " enter normal mode
  tnoremap <silent> <ScrollWheelUp> <c-w>:call EnterTerminalNormalMode()<CR>
  nnoremap <silent> <ScrollWheelDown> <ScrollWheelDown>:call ExitTerminalNormalModeIfBottom()<CR>
endif
