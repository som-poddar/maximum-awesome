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
  colored-man-pages
  docker
  git
  git-extras
  github
  jira
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

# ranger
alias rg="ranger"

# dotfiles
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sp="source ~/.profile; source ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"

# ruby
alias rbc="bundle exec rubocop --format simple --display-cop-names"

# jira
export JIRA_URL="https://ellation.atlassian.net"
export JIRA_NAME="spoddar"
export JIRA_PREFIX=""
export JIRA_RAPID_BOARD="true"
# export JIRA_DEFAULT_ACTION=""

# git
alias gd="git diff"
alias gt="git status"
alias gs="smerge ." # require sublime merge

# golang
alias gf="gofmt -s -w ."
alias gl="gofmt -l ."

# makefile
alias mb="make build"
alias mr="make run"

# history
alias hs="history -E"

# tmux
alias tmi="exec ~/.tmux-init"
export HISTTIMEFORMAT="%d/%m/%y %T "
