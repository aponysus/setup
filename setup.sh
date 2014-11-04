#!/bin/bash
# Simple setup.sh for configuring my environment

sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y screen

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

if [ -d ./.vim/ ]; then
    mv .vim old_vimfiles
fi

git clone https://github.com/aponysus/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.vimrc .

mkdir ~/.vim
cd ~/.vim && git init
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/.tmp
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone http://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git submodule add https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes
