#!/bin/bash
set -e

cd ~/src/github.com/takady
git clone https://github.com/takady/.emacs.d
git clone https://github.com/takady/oh-my-zsh

cd ~
ln -sf ~/src/github.com/takady/dotfiles/.zshrc
ln -sf ~/src/github.com/takady/dotfiles/.tmux.conf
ln -sf ~/src/github.com/takady/.emacs.d
ln -sf ~/src/github.com/takady/oh-my-zsh .oh-my-zsh
