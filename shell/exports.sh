export DOTFILES=~/.dotfiles                 # here
export ARCHFLAGS='-arch x86_64'             # archflags
# export PATH=$HOME/bin:/usr/local/bin:$PATH  # path settings

path_prepend "/usr/local/bin"
path_prepend "$HOME/bin"

# path_add "/usr/local/sbin"
# path_add "/usr/local/share/npm/bin"

# if type go >/dev/null 2>&1; then
#   export GOPATH="$(realpath `which go` | sed "s/\/libexec\/bin\/go//")"
#   path_add "$GOPATH/bin"
# fi
