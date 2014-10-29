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
the-unarchiver

## Utils
caffeine
appcleaner
little-snitch
spectacle
day-o
disk-inventory-x
teamviewer

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
# qlstephen  # Hangs up finder when browsing/quicklooking medium size files non-standard extensions. Tested in Yosemite.
quicklook-json
quicklook-csv
betterzipql
webp-quicklook
suspicious-package

## Others
handbrake
imageoptim
imagealpha

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

