#!/bin/sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

curph=`pwd`

`ln -s $curph/.vimrc $HOME/.vimrc`

