export DOTFILES=~/.dotfiles                 # here
export ARCHFLAGS='-arch x86_64'             # archflags
export GREP_OPTIONS='--color=auto'          # double rainbow!
export PATH=$HOME/bin:/usr/local/bin:$PATH  # path settings
export GH_LOGIN=twe4ked                     # used by git-go

path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${PATH:+"$PATH:"}$1"
  fi
}

path_add "/usr/local/sbin"
path_add "/usr/local/share/npm/bin"

if type go >/dev/null 2>&1; then
  export GOPATH="$(realpath `which go` | sed "s/\/libexec\/bin\/go//")"
  path_add "$GOPATH/bin"
fi

# used by `dvcs` alias
export GH_BASE=~/Dev/git
export GH_USER="$GH_LOGIN"

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
