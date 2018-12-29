#!/bin/sh

# Install applications using `brew cask`
# Assumes that `brew cask` is installed and available.

# Apps
apps=(

## Essentials
google-chrome
firefox
skype
# vlc
# the-unarchiver
# clipmenu
transmission
# flux
# microsoft-office

## Utils
appcleaner
little-snitch
# disk-inventory-x
# teamviewer

## Developer
iterm2
sublime-text
github

## Photography
# adobe-creative-cloud

## Quicklook Extensions
# qlcolorcode
# qlmarkdown
# qlprettypatch
# quicklook-json
# quicklook-csv
# betterzipql
# webpquicklook
# suspicious-package

## Others
# handbrake
# imageoptim
# imagealpha

## Unused
#  spectacle
#  vagrant
#  virtualbox
#  caffeine
#  alfred
#  screenflick
#  spotify
#  arq
#  flash
#  atom
#  mailbox
#  sketch
#  tower
#  cloudup
#  nvalt
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing Apps..."
brew cask install --appdir="/Applications" ${apps[@]}

