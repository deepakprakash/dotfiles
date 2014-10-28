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
httpie
curl
rsync

## Utils
graphicsmagick
webkit2png
zopfli
ffmpeg
# sshfs
# osxfuse
mackup
rename
)

echo "Installing tools..."
brew install ${tools[@]}


echo "Cleaning up..."
brew cleanup
