# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="takady"
plugins=(git ruby rails bundler colored-man)
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/.env
export TERM="xterm-256color"

# rbenv
eval "$(rbenv init -)"

# editor
export EDITOR='emacsclient -t'
alias e='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"
alias s="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias rtags='ripper-tags -e -R -f'

# go
export GOPATH=$HOME
export GOROOT=`go env GOROOT`
export PATH=$GOROOT/bin:$PATH

# go run
function gorun() {
    go run $(ls *.go | grep -v _test.go)
}

# ghq+peco
alias cdg='cd $(ghq list -p | peco)'

# history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_reduce_blanks

# history search
function peco-select-history() {
    BUFFER=$(\history -n 1 | tail -r | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
