#!/bin/sh

tools=(

## GNU core utilities (those that come with OS X are outdated)
coreutils

## GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
findutils

## Install more recent versions of some OS X tools
homebrew/dupes/grep

bash
rename
python
node
tree
hub
git
zsh
wget
ack
trash

## Utils
graphicsmagick
webkit2png
zopfli
ffmpeg
#  sshfs
)

echo "Installing tools..."
brew install ${tools[@]}


echo "Cleaning up..."
brew cleanup
