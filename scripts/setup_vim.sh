#!/bin/sh

echo "Install vim-plug..."

# vim-plug
curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install vim-plug...Done!"
echo "Reload .vimrc and :PlugInstall to install plugins."

# create backup dir
mkdir -p ~/.vimbackup
