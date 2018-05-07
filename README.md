# Set up my develop enviroment in a new os x system
## Set up zsh
#### brew install zsh zsh-completions
```
brew install zsh
brew install zsh-completions
```
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
- Python is prerequisite for three of my vim plugins.
  1. YouCompleteMe requires Vim compiled with Python (2.6+ or 3.3+) support.
  2. deoplete.nvim requires Neovim or Vim8 with `if_python3`. See: https://github.com/Shougo/deoplete.nvim
    ```
    brew install python3
    pip3 install --upgrade neovim // Seems necessary otherwise you will meet some stupid error and can not enable deoplete.
    ```
  3. MatchTagAlways requires python.
  4. UltiSnips requires py >= 2.7 or py3

#### Install
- Install prerequisites
  ```
  // For OSX
  brew install ack    // for ctrlsf and ack.vim
  brew install ctags
  brew install CMake  // for install YCM

  // For Ubuntu need those dependencies
  sudo apt-get update && sudo apt-get install build-essential
  sudo apt-get install cmake
  sudo apt-get install python-dev libxml2-dev libxslt-dev

  // If python3
  sudo apt-get install python3-dev libxml2-dev libxslt-dev
  ```
- Install GVIM
  ```
  // enable python3 if use deoplete.nvim
  brew install vim --with-python3 --without-python --with-override-system-vim
  brew install macvim --with-python3 --without-python --with-override-system-vim

  // enable lua with macvim if use YCM.
  brew install macvim --with-cscope --with-lua --override-system-vim
  ```
#### Clone repos
```
cd && git clone git@github.com:NaiveCAI/dotfiles.git
```
#### Create links
```
mkdir ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -sf ~/dotfiles/vim/change_vim_theme.sh ~/.vim/change_vim_theme
```

## Set up neovim
#### Install
```
brew install neovim
```

#### Install python dependency
```
pip2 install --user neovim
or
pip3 install --user neovim
```

#### Create links
```
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/UltiSnips ~/.config/nvim/UltiSnips
ln -sf ~/.vim/bundle ~/.config/nvim/bundle
```

## Set up rails specific configurations
```
gem install gem-ctags
gem ctags
ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)

ln -sf ~/dotfiles/ruby/.pryrc ~/.pryrc
```

## Set up python specific configurations
```
pip install yapf
pip install pylint
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


# Fuck GongFei's gfw using shadowsocksNG with privoxy
```
brew install privoxy
brew services start privoxy
sudo vim /usr/local/etc/privoxy/config

// 1080 for shadowsocks and 1086 for shadowsocksNG
forward-socks5 / 127.0.0.1:1080 .

alias open_proxy='export http_proxy=localhost:8118 https_proxy=localhost:8118'
```
