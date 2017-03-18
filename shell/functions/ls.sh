# Functions and aliases for a consistent and clean `ls` across platforms.

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

        # The variable GNU_COREUTILS_PATH is exported with a valid path on zsh start
        # if the gnucoreutils are installed. Refer: shell/exports.sh
        # So it suffices to check if that variable is defined and valid.

        if [ -z "$GNU_COREUTILS_PATH" ]; then
            # $GNU_COREUTILS_PATH is empty or undefined.
            # So native `ls`
            command ls $common_args -G "$@"
        else
            # $GNU_COREUTILS_PATH is a non-empty value.
            # GNU `ls` from homebrew
            command ls $common_args --color=auto "$@"
        fi
        ;;

      *)
        command ls $common_args --color=auto "$@"
    esac
}

# Started out / used making `ls` itself aliased to `list`. But this it a bit
# dirty and causes issues at times, while the only advantage is that when using
# the `ls` command directly, the colors and common args in `list()` are taken
# care of. These tradeoffs dont seem worth it and hence just start off with the
# `ll` alias which is what I use 99.9% of the time.
alias ll="list -Al"  # Show all except . and .. (-A); Detailed view(-l);

# Convenience aliases
alias llt="ll -t"  # ll sorted by last modified time
alias lls="ll -S"  # ll sorted by size
