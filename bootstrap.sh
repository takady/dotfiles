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

# Ricty for powerline
cd /tmp
git clone https://github.com/yascentur/Ricty.git
cd Ricty
git clone https://github.com/powerline/fonts.git
wget http://sourceforge.jp/frs/redir.php\?m\=jaist\&f\=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip -O migu-1m-20130617.zip
unzip migu-1m-20130617.zip
./ricty_generator.sh fonts/Inconsolata/Inconsolata\ for\ Powerline.otf migu-1m-20130617/migu-1m-regular.ttf migu-1m-20130617/migu-1m-bold.ttf
cp -f ./Ricty*.ttf ~/Library/Fonts
fc-cache -vf

# powerline
easy_install pip
pip install --user psutil
