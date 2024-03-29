let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $RC_DIR = g:config_home . '/vim'

" loading base settings
if filereadable($RC_DIR.'/basic.vim')
  source $RC_DIR/basic.vim
endif

" package manager
if filereadable($RC_DIR.'/plugin.vim')
  source $RC_DIR/plugin.vim
  source $RC_DIR/plugins/mapping.vim
endif

syntax on
