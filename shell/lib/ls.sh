# Functions and aliases for a consistent and clean `ls`.

list () {
    # ls with:
    #  > colored output (`-G` argument for native OSX `ls`; else `--color=auto`)
    #  > trailing slash for directories in output (`-F` argument)
    #  > human readable sizes (`-h` argument) - when using options that show size
    local common_args="-Fh"
    case $OSTYPE in
      darwin*)
        # The native OSX `ls` does not support `--color` argument - hence need
        # to check if the current `ls` is native or the GNU one from homebrew's
        # coreutils
        local ls_path="$(which ls)"
        if [ "$ls_path" = "/bin/ls" ]; then
            # Native `ls`
            ls $common_args -G "$@"
        else
            # GNU `ls` from homebrew
            ls $common_args --color=auto "$@"
        fi
        ;;

      linux*)
        ls $common_args --color=auto "$@"
    esac
}

# An alias for `ls` to `list` seems cleaner than directly having a function
# called `ls`, since we can always access the raw `ls` if required, by doing
# `unalias ls`. There also seems to be some weird issues if an `ls` function
# is created and directly used.
alias ls="list"

# Convenience aliases
alias l="ls -Al" # Show all except . and .. (-A); Detailed view(-l);
