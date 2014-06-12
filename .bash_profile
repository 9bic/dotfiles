# ls coloring
alias ls="ls -alG"
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export PATH=/usr/local/bin:$PATH
alias vim="/usr/local/Cellar/vim/7.4.273/bin/vim"
# completion Homebrew Commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew  --prefix)/etc/bash_completion
fi

if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
