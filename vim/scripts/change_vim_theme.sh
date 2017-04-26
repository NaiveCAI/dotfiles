#!/bin/bash

ORIGINAL_THEME=$(sed -n '/\"macvim_theme/'p ~/dotfiles/vim/.vimrc |grep -oE '(\w*)\s*"' |grep -oE '(\w*)')
ORIGINAL_AIRLINE_THEME=$(sed -n '/\"macvim_airline_theme/p' ~/dotfiles/vim/.vimrc |grep -o "'[a-z]*'" |sed s/\'//g)
ORIGINAL_TRANSPARENCY=$(sed -n '/transparency/'p ~/dotfiles/vim/.vimrc |grep -oE '[0-9a-zA-Z]*$')

function change() {
  theme_name=$1
  transparency=$2
  # change_theme
  if [ "$theme_name" != '' ]; then
    vim_theme_line_num=$(sed -n '/\"macvim_theme/'= ~/dotfiles/vim/.vimrc)
    airline_theme_line_num=$(sed -n '/\"macvim_airline_theme/'= ~/dotfiles/vim/.vimrc)
    sed -i '.bak' "${vim_theme_line_num}s/$ORIGINAL_THEME/${theme_name}/" ~/dotfiles/vim/.vimrc

    has_airline_theme=1
    for entry in ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/*
    do
      file_name=${entry##*/}
      if [[ ${theme_name} = ${file_name%.*} ]]; then
        has_airline_theme=0
        break
      else
        has_airline_theme=1
      fi
    done
    # 如果没有这个主题文件，则注释airline这行
    if [ $has_airline_theme -gt 0 ]; then
      # 如果这行没有被注释则注释之
      if [ -z "$(sed -n "${airline_theme_line_num}p" ~/dotfiles/vim/.vimrc |grep -oE '^"')" ]; then
        sed -i '.bak' "${airline_theme_line_num}s/^/\"/" ~/dotfiles/vim/.vimrc
      fi
    # 如果有这个主题文件
    else
      # 如果这行被注释
      if [[ $(sed -n "${airline_theme_line_num}p" ~/dotfiles/vim/.vimrc |grep -oE '^"') ]]; then
        sed -i '.bak' "${airline_theme_line_num}s/^\"//" ~/dotfiles/vim/.vimrc
      fi
      sed -i '.bak' "${airline_theme_line_num}s/$ORIGINAL_AIRLINE_THEME/${theme_name}/" ~/dotfiles/vim/.vimrc
    fi
  else
    theme_name=$ORIGINAL_THEME
  fi

  # change_transparency
  if [ "$transparency" != '' ]; then
    line_num=$(sed -n '/transparency/'= ~/dotfiles/vim/.vimrc)
    sed -i '.bak' "${line_num}s/$ORIGINAL_TRANSPARENCY/${transparency}/" ~/dotfiles/vim/.vimrc
  else
    transparency=$ORIGINAL_TRANSPARENCY
  fi
}

if [ $# -eq 2 ]; then
  test $1 -ge 0 &> /dev/null
  # If first arg is string
  if [ $? -gt 1 ]; then
    theme_name=$1
    transparency=$2
  else
    theme_name=$2
    transparency=$1
  fi
  change $theme_name $transparency
elif [ $# -eq 1 ]; then
  test $1 -ge 0 &> /dev/null
  if [ $? -gt 1 ]; then
    theme_name=$1
    change $theme_name ""
  else
    transparency=$1
    change "" $transparency
  fi
fi
