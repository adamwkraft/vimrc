#!/bin/bash

# Bash script to help set up vim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py
