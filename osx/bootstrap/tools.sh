#!/bin/sh

tools=(

## GNU core utilities (those that come with OS X are outdated)
# The ` --with-default-names` option does work with coreutils anymore
"coreutils"

## Install more recent/GNU versions of some OS X tools
"findutils --with-default-names"  # GNU `find`, `locate`, `updatedb`, and `xargs`
"gnu-indent --with-default-names"
"gnu-sed --with-default-names"
"gnu-tar --with-default-names"
"gnu-which --with-default-names"
"grep --with-default-names"
# ed --with-default-names
# binutils
"diffutils"
"gnutls"
"gzip"
"gawk"
# watch
"wdiff --with-gettext"
"wget"

## Essentials
"bash"
"zsh"

"hub"
"git"
"hg"

"python"
"go"
"node"

"vim --override-system-vi"

"tree"
"ack"
"trash"
"ssh-copy-id"

"httpie"
"curl"
"rsync"

## Utils
"graphicsmagick"
"webkit2png"
"zopfli"
"ffmpeg"
"mackup"
"rename"
# https://github.com/soimort/translate-shell
)

echo "Installing tools..."
for i in "${tools[@]}"; do
    brew install $i
done

echo "Cleaning up..."
brew cleanup
