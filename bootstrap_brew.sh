#!/bin/bash
set -e

if test ! $(which brew); then
  echo 'Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install git
brew install mercurial
brew install openssl
brew install readline
brew install vim
brew install --cocoa -srgb --with-gnutls --japanese emacs
brew linkapps
brew install cask
brew install ctags
brew install rbenv
brew install ruby-build
brew install go --cross-compile-common
brew install python
brew install mysql
brew install nkf
brew install w3m
brew install wget
brew install tree
brew install tmux
brew install reattach-to-user-namespace
brew install peco
brew tap motemen/ghq
brew install ghq
brew tap tcnksm/ghr
brew install ghr

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew install caskroom/cask/brew-cask
brew cask install atom
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install karabiner
brew cask install virtualbox
brew cask install vagrant
brew cask install cyberduck
brew cask install insomniax
brew tap caskroom/homebrew-versions
brew cask install sublime-text3
brew cask install dash
