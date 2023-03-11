" plugin manager
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"let g:dein#enable_notification = v:true
let g:dein#install_check_diff = v:true
let g:dein#install_check_remote_threshold = 24 * 60 * 60

" if not exists dein.vim in local environments, download dein.vim
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" package configs
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:toml_dir    = g:config_home . '/vim/plugins'

  let s:toml        = g:toml_dir . '/dein.toml'
  let s:editor      = g:toml_dir . '/editor.toml'
  let s:completion  = g:toml_dir . '/completion.toml'
  let s:fazy_finder = g:toml_dir . '/fazy_finder.toml'
  let s:filer       = g:toml_dir . '/filer.toml'
  let s:tags        = g:toml_dir . '/tags.toml'
  let s:syntax      = g:toml_dir . '/syntax.toml'
  let s:appearance  = g:toml_dir . '/appearance.toml'

  call dein#load_toml(s:toml,        { 'lazy': 0})
  call dein#load_toml(s:appearance,  { 'lazy': 1})
  call dein#load_toml(s:editor,      { 'lazy': 1})
  call dein#load_toml(s:fazy_finder, { 'lazy': 1})
  call dein#load_toml(s:filer,       { 'lazy': 1})
  call dein#load_toml(s:completion,  { 'lazy': 1})
  call dein#load_toml(s:syntax,      { 'lazy': 1})
  call dein#load_toml(s:tags,        { 'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
