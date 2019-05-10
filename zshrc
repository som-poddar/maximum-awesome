# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes
# chose one of "kolo", "espresso", "elementa", "robbyrussell"
ZSH_THEME="kolo"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(
  aws
  brew
  docker
  git
  git-extras
  github
  vi-mode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases #

# generic
alias la="ls -al"
alias ll="ls -l"
alias lsln="ls -al | grep \"\->\""
alias gtp="gtypist -e 8%"
alias ptr="tree -h --du -t --dirsfirst -c -I vendor -D"

# dotfiles
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sp="source ~/.profile; source ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"

# ruby
alias rbc="bundle exec rubocop --format simple --display-cop-names"

# git
alias gd="git diff"
alias gt="git status"

# golang
alias gf="gofmt -s -w ."
alias gl="gofmt -l ."

# makefile
alias mb="make build"
alias mr="make run"

# tmux
alias tmi="exec ~/.tmux-init"
