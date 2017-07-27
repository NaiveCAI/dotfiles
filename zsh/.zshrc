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
alias gpum='git pull origin master'
alias gpsm='git push origin master'
alias gc-='git checkout -'
alias gmisc="git add . && git commit -m 'MISC - Update.'"

alias rs='rails s'
alias rc='rails c'
alias rsb='rails s -b 0.0.0.0'
alias rs1='rails s -p 3001'
alias rs2='rails s -p 3002'
alias rr='rake routes |grep'

alias babel='./node_modules/babel-cli/bin/babel.js'
alias babel-node='./node_modules/babel-cli/bin/babel-node.js'

alias update_vim='cd ~/.vim && git submodule foreach git pull origin master'
alias stree='open -a SourceTree .'
alias gitup='open -a GitUp .'
alias dockup="source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"

ZSH_THEME="robbyrussell"    # "cloud || ys || agnoster || amuse"

plugins=(git)
plugins=(osx)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [[ -n $SSH_CONNECTION  ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export PATH="$PATH:/usr/local/mysql/bin"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/Documents/Projects/go_projects"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"

if [ $(($RANDOM%2)) -eq 0 ]; then
  fortune | cowsay -w | lolcat
else
  fortune | cowthink -d | lolcat
fi

#
# Dynamically change vim theme
# TODO: Refactor this function to a file -- .zsh_functions
#
# change_vim_theme() {
#   # autoload +X change_vim_theme
#   time=$(date +"%T")
#   hour=${time:0:2}
#   themes=(kalisi gruvbox hybrid solarized)
#   seed=$(($RANDOM%4))
#   zsh -c "change_vim_theme.sh $themes[$seed]"
# }
