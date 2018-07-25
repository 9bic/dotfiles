#!/bin/bash

dotfiles=(.vimrc .gvimrc .vimrc.lightline .vimrc.neocomplete .vimrc.unite .bashrc .bash_profile com.googlecode.iterm2.plist .zshenv .zshrc )

for file in ${dotfiles[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
