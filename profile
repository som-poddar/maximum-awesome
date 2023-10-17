echo "loading profile"
# set gopath
export GOPATH=$HOME/workspace

# set goroot
export GOROOT=/usr/local/opt/go@1.19/libexec
export GOBIN=$GOPATH/bin

# set path
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/Users/spoddar/Library/Python/3.7/bin
export PATH=$PATH:/usr/local/sbin
# export PATH=$PATH:/Users/spoddar/workspace/src/github.com/discoveryinc-dtc/git-history-importer

# setting for 'aws-fuzzy'
# export AWS_FUZZ_USER="centos"
# export AWS_FUZZ_KEY_PATH="~/.ssh/id_rsa"
# export AWS_FUZZ_PRIVATE_IP='true' # Delete this one if you want to use public IP's
# export AWS_DEFAULT_REGION=us-east-1

# settings for Vim
# export VIMHOME="~/workspace/src/bitbucket.com/som-poddar/maximum-awesome"

source ~/.profile.local
