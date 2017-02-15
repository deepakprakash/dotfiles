# Functions and aliases for a consistent and clean `ls` across platforms.

# This needs to be here at the global level and NOT inside the `list()` since we
# alias ls later to list(). So if we call this inside list(), we wont get the
# correct one after the first time. Also helps with performance since we dont
# do this costly operation everytime list() is called.
local ls_path="$(which ls)"

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
        if [ "$ls_path" = "/bin/ls" ]; then
            # Native `ls`
            command ls $common_args -G "$@"
        else
            # GNU `ls` from homebrew
            command ls $common_args --color=auto "$@"
        fi
        ;;

      linux*)
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
