
# Setup OSX to use the brew coreutils
if which brew > /dev/null; then
    # Brew is installed
    coreutils_path="$(brew --prefix coreutils)/libexec"

    if [ -d $coreutils_path ]; then
        # Prepend to path
        path_prepend "$coreutils_path/gnubin"

        # Prepend to MANPATH for correct manpages
        MANPATH="$coreutils_path/gnuman:$MANPATH"
    fi
fi

# Fix for Python (https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python)
# and similar issues in SSH, etc
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
