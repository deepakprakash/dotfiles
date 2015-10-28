# Override grep so that we always get colored output.
# Earlier, we could specify the common grep options in the $GREP_OPTIONS - but
# that has been deprecated. This is cleaner in anycase.
function grep() {
    command grep --color=auto "$@"
}
