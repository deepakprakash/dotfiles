export DOTFILES=~/.dotfiles                 # here
export ARCHFLAGS='-arch x86_64'             # archflags

path_prepend "/usr/local/bin"
path_prepend "$HOME/bin"


# local GNU_COREUTILS_PATH = "/usr/local/opt/coreutils/libexec/gnubin"
# if [ -d "$GNU_COREUTILS_PATH" ]; then
#   path_prepend "/usr/local/opt/coreutils/libexec/gnubin"
# fi


# Setup OSX to use the brew coreutils
# if which brew > /dev/null; then
    # Brew is installed
    coreutils_prefix="$(brew --prefix coreutils 2>/dev/null)"

    if [ -d "$coreutils_prefix/libexec/gnubin" ]; then
        # Prepend to path
        export GNU_COREUTILS_PATH="$coreutils_prefix/libexec/gnubin"
        path_prepend "$GNU_COREUTILS_PATH"

        # Prepend to MANPATH for correct manpages
        export MANPATH="$coreutils_prefix/libexec/gnuman:$MANPATH"
    fi
# fi