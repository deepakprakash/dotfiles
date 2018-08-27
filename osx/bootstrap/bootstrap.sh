#!/bin/sh

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Install and setup brew cask..."
brew cask
brew tap caskroom/versions
brew tap caskroom/fonts

