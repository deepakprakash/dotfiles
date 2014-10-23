#!/bin/sh

# Install applications using `brew cask`
# Assumes that `brew cask` is installed and available.

# Apps
apps=(

## Essentials
dropbox
evernote
google-chrome
firefox
skype
vlc
utorrent

## Utils
caffeine
appcleaner
little-snitch
spectacle
day-o
disk-inventory-x

## Developer
iterm2
sublime-text3
vagrant
virtualbox
github

## Quicklook Extensions
qlcolorcode
qlmarkdown
qlprettypatch
qlstephen
quicklook-json
quicklook-csv
betterzipql
webp-quicklook
suspicious-package

## Others
handbrake

## Unused
#  alfred
#  screenflick
#  transmit
#  spotify
#  arq
#  flash
#  atom
#  flux
#  mailbox
#  sketch
#  tower
#  cloudup
#  nvalt
#  transmission
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing Apps..."
brew cask install --appdir="/Applications" ${apps[@]}
