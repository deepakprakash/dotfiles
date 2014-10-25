#!/bin/sh

# Install applications using `brew cask`
# Assumes that `brew cask` is installed and available.

# Fonts
fonts=(
source-code-pro
source-sans-pro
source-serif-pro

open-sans
open-sans-condensed

)

echo "Installing Fonts..."
brew cask install ${fonts[@]/#/font-}  # Prefix "font-" while iterating through array 
