# alias
alias ls="ls -alG"
alias diff="colordiff"
alias free="free -m"
#alias less="less -iMR"

# completion Homebrew Commands
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  . $(brew  --prefix)/etc/bash_completion
fi

# bash completion
if [[ -f /opt/local/etc/bash_completion ]]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# docker envs
if [[ -f .docker/bash/completion ]]; then
  . .docker/bash/completion
fi
# aws completion
if [[ -f /usr/local/bin/aws_completer ]]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi

# git completion
if [[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  source /usr/local/etc/bash_completion.d/git-completion.bash
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
fi
# PS1 settings
export PS1='\[$(tput setaf 7)\][\u@\h] \[$(tput setaf 3)\]\W\[$(tput setaf 2)\]$(__git_ps1 " (%s)") \[$(tput sgr0)\]> \[$(tput sgr0)\]'
export PS2='>'
