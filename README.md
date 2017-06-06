# Set up my develop enviroment in a new os x system
## Set up zsh
#### brew install zsh zsh-completions
#### install oh-my-zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
#### install zsh-autosuggestions
```
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
- then add this plugin to .zshrc
```
plugins=(zsh-autosuggestions)
```
#### install autojump
```
brew install autojump
```

## Set up vim
#### Install
```
brew install ack    // for ctrlsf and ack.vim
brew install ctags
brew install CMake  // for install YCM
```
#### Clone repos
```
cd && git clone git@github.com:NaiveCAI/dotfiles.git
cd && git clone git@github.com:NaiveCAI/vim.git && mv vim .vim
```
#### Then create links
```
ln -sf ~/dotfiles/vim/.gitmodules ~/.vim/.gitmodules
ln -sf ~/dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -sf ~/dotfiles/vim/change_vim_theme.sh ~/.vim/change_vim_theme
```
#### Then init vim git submodules
```
git submodule update --init --recursive
```

## Set rails conf for vim
```
gem install gem-ctags
gem ctags
ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
```

## Other useful plugin in terminal
- brew install tree
- brew install htop
- brew install tig        - another alternative for git command to show git tree in terminal
- brew install mosh
- brew install fzf        - a blur search plugin in terminal, pretty like the ctrlp plugin in vim
- brew install PathPicker - file path picker use it with git is sweet
  > git diff HEAD~8 --stat | fpp
- brew install cmatrix


# Fuck gfw using shadowsocksNG with privoxy
```
brew install privoxy
brew services start privoxy
sudo vim /usr/local/etc/privoxy/config

// 1080 for shadowsocks and 1086 for shadowsocksNG
forward-socks5 / 127.0.0.1:1080 .

alias open_proxy='export http_proxy=localhost:8118 https_proxy=localhost:8118'
```
