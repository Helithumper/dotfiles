#!/bin/bash

# create dir for screenshots
mkdir ~/Pictures/screenshots

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install CtrlP
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install dracula vim
mkdir ~/.vim/colors
wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim -P ~/.vim/colors

# Symlink the dotfiles
ln -s ./.zshrc ~/.zshrc
ln -s ./.tmux.conf ~/.tmux.conf
ln -s ./.vimrc ~/.vimrc
ln -s ./rainbow_config ~/.rainbow_config
ln -s ./.aliases ~/.aliases

echo "Done-Press enter"
read
