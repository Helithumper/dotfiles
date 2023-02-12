#!/bin/bash
mkdir -p ./bundle
git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
nvim +PluginInstall +qall
pip3 install neovim
pip install neovim
