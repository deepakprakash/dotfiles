#!/bin/sh

tools=(

## GNU core utilities (those that come with OS X are outdated)
# The ` --with-default-names` option does work with coreutils - but we have
# the mechanism in shell/exports.sh that makes sure that the coreutils is added to PATH
"coreutils"

## Install more recent/GNU versions of some OS X tools.

# These are installed with the --with-default-names option since they all have
# separate install locations and adding each one to PATH is cumbersome and error prone
"findutils --with-default-names"  # GNU `find`, `locate`, `updatedb`, and `xargs`
"gnu-indent --with-default-names"
"gnu-sed --with-default-names"
"gnu-tar --with-default-names"
"gnu-which --with-default-names"
"grep --with-default-names"
# ed --with-default-names

# "binutils"
"diffutils"
"gnutls"
"gzip"
"gawk"
"watch"
"wdiff --with-gettext"

## Essentials
"bash"
"zsh"
"git"
"hg"

"curl"
"wget"

## Languages
"python"
# "ruby"
# "go"
"node"

## Editors
"vim --override-system-vi"

## System Utils
"tree"
"ack"
"trash"
"ssh-copy-id"
"htop"
"iproute2mac"

## General Utils
"httpie"
"rsync"
"mackup"
"rename"

# "terminal-notifier"
# "graphicsmagick"
# "webkit2png"
# "zopfli"
# "ffmpeg"
# https://github.com/soimort/translate-shell
)

echo "Installing tools..."
for i in "${tools[@]}"; do
    brew install $i
done

echo "Cleaning up..."
brew cleanup
