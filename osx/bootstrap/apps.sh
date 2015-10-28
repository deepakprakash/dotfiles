#!/bin/sh

# Install applications using `brew cask`
# Assumes that `brew cask` is installed and available.

# Apps
apps=(

## Essentials
dropbox
google-chrome
firefox
skype
vlc
utorrent
the-unarchiver
clipmenu

## Utils
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
webpquicklook
suspicious-package

## Others
handbrake
imageoptim
imagealpha

## Unused
#  caffeine
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

