#!/bin/bash
set -e

# homebrew
./bootstrap_brew.sh

# symbolic link
./bootstrap_ln.sh

# emacs cask
cd ~/.emacs.d
cask install

# show all files
defaults write com.apple.finder AppleShowAllFiles TRUE
