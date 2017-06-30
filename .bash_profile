export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export PATH=/usr/local/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# less with color(lesspipe)
if [[ -f /usr/local/bin/lesspipe.sh ]]; then
  export LESS='-R'
  export LESSCHARSET="utf-8"
  export LESS_ADVANCED_PREPROCESSOR="1"
  export LESSOPEN='|/usr/local/bin/lesspipe.sh "%s"'
fi

if [[ -f $HOME/.bashrc ]]; then
  source $HOME/.bashrc
fi
