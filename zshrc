# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/spoddar/.oh-my-zsh

# Themes
# Chose one of "kolo", "espresso", "elementa", "robbyrussell"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(
  git
  aws
  brew
  docker
  zsh-autosuggestions
  github
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias la="ls -al"
alias ll="ls -l"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias ptr="tree -h --du -t --dirsfirst -c -I 'vendor'-D"
alias rbc="bundle exec rubocop --format simple --display-cop-names"
alias sp="source ~/.profile"
alias zshconfig="mvim ~/.zshrc"
