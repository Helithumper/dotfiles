#!/bin/bash

# install lot of apps
sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get install -y vim tmux zsh cmus gdb gcc build-essential htop ranger vlc steam openvpn-client bless filezilla hexchat wireshark openjdk-9-jdk python-pip python-dev

sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
sudo pip install rainbowstream


# Download Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

sudo apt-get install apt-transport-https

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install sublime-text

# Download Spotify

# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

# create dir for screenshots
mkdir ~/Pictures/screenshots

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install CtrlP
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# need to activate plugin in ~/.zshrc
# plugins=( [plugins...] zsh-syntax-highlighting)
# source ~/.zshrc

# Install dracula vim
mkdir ~/.vim/colors
wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim -P ~/.vim/colors

# Install Peppermint via Gogh
wget -O xt  http://git.io/v3DBK && chmod +x xt && ./xt && rm xt

# Symlink the dotfiles
ln -s ./.zshrc ~/.zshrc
ln -s ./.tmux.conf ~/.tmux.conf
ln -s ./.vimrc ~/.vimrc
ln -s ./rainbow_config ~/.rainbow_config
ln -s ./.aliases ~/.aliases

echo "Done-Press enter"
read