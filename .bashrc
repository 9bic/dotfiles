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

export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/9bic/working/faultline/node_modules/tabtab/.completions/serverless.bash ] && . /Users/9bic/working/faultline/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/9bic/working/faultline/node_modules/tabtab/.completions/sls.bash ] && . /Users/9bic/working/faultline/node_modules/tabtab/.completions/sls.bash

# gcloud cli
if [[ -f $HOME/working/google-cloud-sdk/completion.bash.inc ]]; then
  source $HOME/working/google-cloud-sdk/completion.bash.inc
  source $HOME/working/google-cloud-sdk/path.bash.inc
fi
alias namegen='docker run -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD:/rootfs/$PWD" -w="/rootfs/$PWD" gcr.io/denki-chat-proto/namegen:v0.0.1'
