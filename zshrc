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
  asdf
  aws
  brew
  colored-man-pages
  docker
  fzf-zsh-plugin
  git
  git-extras
  github
  jira
  vi-mode
  zsh-autosuggestions
  kube-ps1
)

source $ZSH/oh-my-zsh.sh
compdef vman="man"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases #

# generic
alias gtp="gtypist -e 8%"
alias la="ls -al"
alias lc="leetcode"
alias ld="ls -dl */"
alias ll="ls -lhA -1 --group-directories-first"
alias lls="ls -hA -1 --group-directories-first"
alias lsln="ls -al | grep \"\->\""
alias ptr="tree -h --du -t --dirsfirst -c -I vendor -D"

# curl
alias curl="curl -s"

# file
alias trim="LC_CTYPE=C LANG=C find . -not \( -name .svn -prune -o -name .git -prune \) -type f -print0 | xargs -0 sed -i '' -E \"s/[[:space:]]*$//\""

# navigation
alias cde="cd ~/workspace/src/bitbucket.com/everything/"
alias cdn="cd ~/workspace/src/bitbucket.com/notes"
alias cdw="cd ~/workspace/src/github.com/wbd-streaming/"

# icloud
alias brg="cd ~/Library/Mobile\ Documents/iCloud~com~appsonthemove~beorg/Documents/org"
alias cio="~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias fsn="/Users/spoddar/Library/Mobile\ Documents/iCloud~co~fluder~fsnotes/Documents"

# ranger
alias rg="ranger"

## docker
# remove stopped containers
alias drmc="docker rm \$(docker ps -a -q -f status=exited)"

# remove all images
alias drmi="docker image prune -a"

## dotfiles
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sp="source ~/.profile; source ~/.oh-my-zsh; source ~/.zshrc"
alias zshc="vim ~/.zshrc"

## ruby
alias rbc="bundle exec rubocop --format simple --display-cop-names"

## git
alias gcm="git checkout master;git pull"
alias gd="git diff"
alias gt="git status"

## golang
alias gf="gofmt -s -w ."
alias gl="gofmt -l ."

## makefile
alias mb="make build"
alias mr="make run"
alias mbd="make build docker start show"

## history
alias hs="history -E"

## aws-cli
alias uaws="unset AWS_SESSION_TOKEN AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY"

## kubernetes
alias kc="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias kcv="kubectl get pods -o jsonpath=\"{.items[*].spec.containers[*].image}\"|tr -s '[[:space:]]' '\n' |sort |uniq -c"

## tmux
alias tmi="exec ~/.tmux-init"
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/go@1.16/bin:$PATH"
# export PATH="$HOME/.asdf/shims:$PATH"
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# HBO Max Setup
source $HOME/workspace/assume_role
source $HOME/workspace/vault_auth

export OKTA_USERNAME="som.poddar@warnermedia.com"

# for aws_sso_profile() and aws_launch_console()
source ~/workspace/src/github.com/wbd-streaming/developer-tools/scripts/aws-helpers.sh

# for set_kubectl()
# source ~/workspace/src/github.com/wbd-streaming/developer-tools/scripts/kube-helpers.sh

# alias kubeus-west-2--prodhurleyus="kubectl --context=prod_hurleyus_us-west-2_1"
# alias kubeus-east-1--prodhurleyus="kubectl --context=prod_hurleyus_us-east-1_1"

# . $(brew --prefix asdf)/asdf.sh

# KubeConfig
export KUBECONFIG=$KUBECONFIG:$(find $HOME/.kube/wbd -name '*kubeconfig' | xargs | sed 's/ /:/g')

source <(kubectl completion zsh)

export HOMEBREW_GITHUB_API_TOKEN=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

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh
