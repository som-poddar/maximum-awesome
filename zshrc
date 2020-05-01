# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes
# chose one of "kolo", "espresso", "elementa", "robbyrussell", "avit"
ZSH_THEME="avit"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(
  aws
  brew
  colored-man-pages
  docker
  fzf-zsh
  git
  git-extras
  github
  jira
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases #

# generic
alias gtp="gtypist -e 8%"
alias la="ls -al"
alias lc="leetcode"
alias ld="ls -dl */"
alias ll="ls -l"
alias lsln="ls -al | grep \"\->\""
alias ptr="tree -h --du -t --dirsfirst -c -I vendor -D"

# curl
alias curl="curl -s"

# file
alias trim="LC_CTYPE=C LANG=C find . -not \( -name .svn -prune -o -name .git -prune \) -type f -print0 | xargs -0 sed -i '' -E \"s/[[:space:]]*$//\""
# navigation
alias cde="cd ~/workspace/personal/src/bitbucket.com/som-poddar/everything/"
alias cdn="cd ~/workspace/personal/src/bitbucket.com/som-poddar/notes"
alias cdw="cd ~/workspace/work/src/github.com/crunchyroll/"

# icloud
alias cio="cd ~/Library/Mobile\ Documents/iCloud~com~appsonthemove~beorg/Documents/org"

# ranger
alias rg="ranger"

## docker
# remove stopped containers
alias drmc="docker rm \$(docker ps -a -q -f status=exited)"
# remove all images
alias drmi="docker image prune -a"

## dotfiles
alias ohmyzsh="vim ~/.oh-my-zsh"
# alias sp="source ~/.profile; source ~/.oh-my-zsh; source ~/.zshrc ;source ~/.vimrc source ~/.tmux"
alias sp="source ~/.profile; source ~/.oh-my-zsh; source ~/.zshrc"
alias zshconfig="vim ~/.zshrc"

## ruby
alias rbc="bundle exec rubocop --format simple --display-cop-names"

## jira
export JIRA_URL="https://ellation.atlassian.net"
export JIRA_NAME="spoddar"
export JIRA_PREFIX=""
export JIRA_RAPID_BOARD="true"

## git
alias gcm="git checkout master;git pull"
alias gd="git diff"
alias gs="smerge ." # require sublime merge
alias gt="git status"

## golang
alias gf="gofmt -s -w ."
alias gl="gofmt -l ."

## makefile
alias mb="make build"
alias mr="make run"

## history
alias hs="history -E"

## tmux
alias tmi="exec ~/.tmux-init"
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
