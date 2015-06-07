# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="takady"
plugins=(git ruby rails bundler colored-man)
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/src/github.com/powerline/powerline/scripts:$HOME/bin:/usr/local/bin:$PATH
source $HOME/.env
export TERM="xterm-256color"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# rbenv
eval "$(rbenv init -)"

# editor
export EDITOR='emacsclient -t'
alias e='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"
alias s="reattach-to-user-namespace /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias rtags='ripper-tags -e -R -f'
export BUNDLER_EDITOR="tmux split-window -c"

# go
export GOPATH=$HOME
export GOROOT=`go env GOROOT`
export PATH=$GOROOT/bin:$PATH

# go run
function gorun() {
    go run $(ls *.go | grep -v _test.go)
}

# ghq+peco
function peco-select-git-repository() {
    local dir=$(ghq list -p | peco)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}
alias cdg="peco-select-git-repository"

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

# colorized cat
alias cat='pygmentize -O style=monokai -f console256 -g'
