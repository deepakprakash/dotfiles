export DOTFILES=~/.dotfiles                 # here
export ARCHFLAGS='-arch x86_64'             # archflags

path_prepend "/usr/local/bin"
path_prepend "$HOME/bin"


# If OSX and gnucoreutils from brew are installed, modify path so
# that the the gnucoreutils get preference
if [[ "$OSTYPE" == "darwin"* ]]; then

	# Get the prefix from brew. By redirecting the stderr of the
	# command to /dev/null, we avoid the error output to terminal if brew itself
	# is not installed or in case of some other error.
	# If brew is installed but coreutils is not installed, it will return
	# a path, but its a non-existant path and hence will be taken care of by the
	# subsequent if condition.
    coreutils_prefix="$(brew --prefix coreutils 2>/dev/null)"

    # We construct the full path to where the executables are installed
    # with their native names and check if the directory exists.
    if [ -d "$coreutils_prefix/libexec/gnubin" ]; then
        # Prepend to path
        export GNU_COREUTILS_PATH="$coreutils_prefix/libexec/gnubin"
        path_prepend "$GNU_COREUTILS_PATH"

        # Prepend to MANPATH for correct manpages
        export MANPATH="$coreutils_prefix/libexec/gnuman:$MANPATH"
    fi
fi