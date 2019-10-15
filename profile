# set gopath
# export GOPATH=$HOME/workspace/opensource
# export GOPATH=$GOPATH:$HOME/workspace/personal
export GOPATH=$HOME/workspace/work

# set goroot
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin

# set path
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/Users/spoddar/Library/Python/2.7/bin
export PATH=$PATH:/Users/spoddar/Library/Python/3.7/bin
export PATH=$PATH:/usr/local/sbin
# setting for 'aws-fuzzy'
export AWS_FUZZ_USER="centos"
export AWS_FUZZ_KEY_PATH="~/.ssh/id_rsa"
export AWS_FUZZ_PRIVATE_IP='true' # Delete this one if you want to use public IP's


export PATH="$HOME/.cargo/bin:$PATH"
