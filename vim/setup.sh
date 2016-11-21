#!/usr/bin/env bash

NOW=`date +"%F %T"`
for DIR in ~/.vimrc ~/.vim
do
    mv $DIR "_dotfiles_backup $NOW `basename $DIR`"
done

mkdir ~/.vim
mkdir ~/.vim/colors
mkdir ~/.vim/files
mkdir ~/.vim/files/info
mkdir ~/.vim/files/swap
mkdir ~/.vim/files/undo
mkdir ~/.vim/files/session

ln -sfv ~/.dotfiles/vim/.vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

