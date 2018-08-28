# Set the GNU_COREUTILS_PATH env and prepend it to PATH

export GNU_COREUTILS_PATH="__GNU_COREUTILS_PREFIX__/libexec/gnubin"
path_prepend "$GNU_COREUTILS_PATH"

# Prepend to MANPATH for correct manpages
export MANPATH="__GNU_COREUTILS_PREFIX__/libexec/gnuman:$MANPATH"
