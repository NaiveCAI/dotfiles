# Set up my develop enviroment in a new os x system
## Set up zsh
#### brew install zsh zsh-completions
```
brew install zsh
brew install zsh-completions

sudo apt-get install zsh
chsh -s $(which zsh)
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

## Set up tmux
### Install
```
# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
### Create links
```
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
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
  sudo npm -g install instant-markdown-d // for vim-instant-markdown


  // For Ubuntu need those dependencies
  sudo apt-get update && sudo apt-get install build-essential
  sudo apt-get install cmake
  sudo apt-get install python-dev libxml2-dev libxslt-dev

  // If python3
  sudo apt-get install python3-dev libxml2-dev libxslt-dev
  ```
- Install GVIM
  ```
  // Need enable python3 if use deoplete.nvim
  brew install vim
  brew install macvim
  ```
- Install NeoVim
  - https://ricostacruz.com/til/neovim-with-python-on-osx

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

# For neovim
ln -s ~/dotfiles/nvim/ ~/.config/nvim

ln -sf ~/dotfiles/lints/.eslintrc ~/.eslintrc
ln -sf ~/dotfiles/lints/pep8 ~/.config/pep8
```

## Set up rails specific configurations
```
# Use ctags
gem install gem-ctags
gem ctags
ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)

# Use ripper-tags for ruby code
gem install ripper-tags
ripper-tags -R --exclude=vendor --exclude=.git --exclude=log . $(bundle list --paths)

ln -sf ~/dotfiles/ruby/.pryrc ~/.pryrc
```

## Set up python specific configurations
```
pip install yapf
pip install pylint
```

## Set up eslint
- https://davidtranscend.com/blog/configure-eslint-prettier-vim/
- https://medium.com/@jimeno0/eslint-and-prettier-in-vim-neovim-7e45f85cf8f9

```
npm i -g eslint
npm i -g -D prettier eslint-plugin-prettier eslint-config-prettier

# Run in current project
eslint --init

# In .eslintrc

{
  "extends": [
    "prettier",
  ],
  "rules": {
    "prettier/prettier": "error",
  },
  "plugins": [
    "prettier"
  ]
}

# In .vimrc
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
```

## Config proxy
```
npm config set proxy http://username:password@host:port
npm config set https-proxy http://username:password@host:port

yarn config set proxy http://username:password@host:port
yarn config set https-proxy http://username:password@host:port

git config --global http.proxy http://username:password@host:port
git config --global https.proxy http://username:password@host:port

// Or in ~/.gitconfig like:
[http]
  proxy = http://username:password@host:port
[https]
  proxy = http://username:password@host:port
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
- For Mac
```
brew install privoxy
brew services start privoxy

// For mac
sudo vim /usr/local/etc/privoxy/config

// 1080 for shadowsocks and 1086 for shadowsocksNG
forward-socks5 / 127.0.0.1:1080 .

alias open_proxy='export http_proxy=localhost:8118 https_proxy=localhost:8118'
```
- For Ubuntu: https://gist.github.com/alexniver/9a4f1791fe4305b0750a

- On ubuntu server under GFW
```
sudo pip install shadowsocks
sudo apt-get install privoxy

vim ~/shadowsocks.json
// Add config below
{
  "server": "",
  "server_port": ,
  "local_port": 1080,
  "password": "",
  "timeout": 600,
  "method": ""
}

sudo vim /etc/privoxy/confg
// Add config
forward-socks5 / 127.0.0.1:1080 .
sudo systemctl restart privoxy

sudo vim /etc/rc.local
// Add config for auto start sslocal
/usr/local/bin/sslocal -c /home/tracy/shadowsocks.json

vim ~/.zshrc
// Add config
alias open_proxy='export http_proxy=localhost:8118 https_proxy=localhost:8118'
alias noproxy='unset http_proxy https_proxy'
```
