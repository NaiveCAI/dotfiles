# Path to your oh-my-zsh installation.

DEFAULT_USER=`whoami`

export ZSH=/Users/$DEFAULT_USER/.oh-my-zsh
alias open_proxy='export http_proxy=http://localhost:8118; export https_proxy=$http_proxy'
alias noproxy='unset http_proxy https_proxy'
alias sp='cmatrix -a -n -s -u 6'
alias o='open .'
alias t='tree -L 1'
alias hs='history |grep'

alias gc='git checkout'
alias gs='git status'
alias gmisc="git add . && git commit -m 'MISC - Update.'"
alias gamm="git add . && git commit --amend --date='now'"

alias rs='rails s'
alias rc='rails c'
alias rr='rake routes |grep'

alias stree='open -a SourceTree .'

ZSH_THEME="amuse"    # "robbyrussell || cloud || ys || agnoster || amuse || bullet-train"

plugins=(git)
plugins=(osx)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"  # For homebrew

if [[ -n $SSH_CONNECTION  ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

export PATH="$PATH:/usr/local/mysql/bin"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/Documents/Projects/go_projects"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/lib/flutter/bin"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export TERM=xterm-256color
