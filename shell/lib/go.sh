## Helper functions for `golang`

# Reset
goquit () {
    if [ ! -z "$GOPATH" ]; then
        path_remove "$GOPATH/bin"
        unset GOPATH
    fi
}

# Set the GOPATH env variable and add the $GOPATH/bin to PATH
# Accepts one path argument - GOPATH will be set to this.
# If no argument is passed, the current dir is used.
gowork () {

    # Use first argument if its specified, else `.`
    # Based on: http://stackoverflow.com/questions/307503/whats-the-best-way-to-check-that-environment-variables-are-set-in-unix-shellscr
    local gpath="${1:-.}"

    # Make sure the dir exists and do path expansion for relative paths
    if [ -d "$gpath" ]; then
        gpath=$(cd "$gpath"; pwd)
    else
        echo "No such directory: $gpath"
        return 1
    fi

    goquit  # Remove existing

    export GOPATH="$gpath"
    path_append "$GOPATH/bin"
}
