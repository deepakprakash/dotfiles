#!/bin/sh

tools=(

## GNU core utilities (those that come with OS X are outdated)
coreutils

## GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
findutils

## Install more recent versions of some OS X tools
homebrew/dupes/grep

## Essentials
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
go

## Utils
graphicsmagick
webkit2png
zopfli
ffmpeg
# sshfs
# osxfuse
mackup
)

echo "Installing tools..."
brew install ${tools[@]}


echo "Cleaning up..."
brew cleanup
