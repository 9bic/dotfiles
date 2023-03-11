setopt IGNOREEOF
export LANG=ja_JP.UTF-8

autoload -Uz colors && colors

# completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh/completion $fpath)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

# bash completionを使う
autoload -U +X bashcompinit && bashcompinit

alias ls="ls -ahlG"
alias diff="colordiff"
alias free="free -m"

# git ps1
if [[ -f ~/.zsh/git-prompt.sh  ]]; then
  source ~/.zsh/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
fi

# kube ps1
if [[ -f /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh  ]]; then
  source /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh
  KUBE_PS1_SYMBOL_ENABLE=false
  KUBE_PS1_SEPARATOR=''
  KUBE_PS1_PREFIX='| '
  KUBE_PS1_SUFFIX=''
  KUBE_PS1_NS_ENABLE=false
fi

# PS1 settings
export PS1='%{${fg[cyan]}%}%D %* %{${fg[yellow]}%}%C %{${fg[green]}%}$(__git_ps1 "(%s)") %{${fg[magenta]}%}$(kube_ps1)
> %{${reset_color}%}'
export PS2='>'

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# terraform completion
if [[ -f /usr/local/bin/terraform ]]; then
  complete -o nospace -C /usr/local/bin/terraform terraform
fi

export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc

export GOPATH=$HOME/.go

# コマンド実行時に時刻上書き
re-prompt() {
    zle .reset-prompt
    zle .accept-line
}

# 1password ssh agent
mkdir -p ~/.1password && ln -sf ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
export SSH_AUTH_SOCK=~/.1password/agent.sock

zle -N accept-line re-prompt
