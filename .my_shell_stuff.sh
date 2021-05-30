export LC_ALL=en_US.UTF-8
export EDITOR=vim

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOHUB=$GOPATH/src/github.com/binjip978
export GITHUB=$GOPATH/src/github.com
export PATH=$PATH:$HOME/.local/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=/usr/local/bin:$PATH
source <(kubectl completion zsh)
