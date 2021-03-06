#!/usr/bin/env bash

# OSX Configuration - forked from https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# and https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
# sudo scutil --set ComputerName "0x6D746873"
# sudo scutil --set HostName "0x6D746873"
# sudo scutil --set LocalHostName "0x6D746873"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Set standby delay to 2 hours (default is 1 hour)
# Speeds up wake from sleep. Ref: http://osxdaily.com/2013/01/21/mac-slow-wake-from-sleep-fix/
# sudo pmset -a standbydelay 16800
# Reset: sudo pmset -a standbydelay 4200

# Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "
# Reset: nvram -d SystemAudioVolume

# The battery drain in newer MacBooks (I think 2015 and newer) is because Apple decided to keep network connections alive
# in standby even when not connected to a power supply. I think the main reason for this is to enable the "Find my Mac"
# feature. The MacBook keeps searching for and connecting to WiFi networks even during sleep.
# sudo pmset -b tcpkeepalive 0

# Disable transparency in the menu bar and elsewhere on Yosemite
# defaults write com.apple.universalaccess reduceTransparency -bool true

# Menu bar: hide the User icon
# for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
# 	defaults write "${domain}" dontAutoLoad -array \
# 		"/System/Library/CoreServices/Menu Extras/User.menu"
# done

# Menu bar: Show the Bluetooth, Airport, Volume and Battery icons
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Volume.menu"
	# "/System/Library/CoreServices/Menu Extras/Battery.menu" # Enable only for laptops


# Set highlight color to green
# defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"
# Reset: defaults delete NSGlobalDomain

# Set sidebar icon size to medium - din't find any effect in Yosemite
# defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
# Reset: defaults delete NSGlobalDomain NSTableViewDefaultSizeMode

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Reset: defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

# Disable smooth scrolling
# (Uncomment if you’re on an older Mac that messes up the animation)
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false
# Reset: defaults delete NSGlobalDomain NSScrollAnimationEnabled

# Increase window resize speed for Cocoa applications
# The 0.001 that is usually used seems too quick for me.
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.005
# Reset: defaults delete NSGlobalDomain NSWindowResizeTime

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Reset: defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode && defaults delete NSGlobalDomain NSNavPanelExpandedStateForSaveMode2

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Reset: defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint && defaults delete NSGlobalDomain PMPrintingExpandedStateForPrint2

# Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Reset: defaults delete NSGlobalDomain NSDocumentSaveNewDocumentsToCloud

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# defaults delete com.apple.print.PrintingPrefs "Quit When Finished"

# Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false
# Reset: defaults delete com.apple.LaunchServices LSQuarantine

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true
# Reset: defaults delete NSGlobalDomain NSTextShowsControlCharacters

# Disable Resume system-wide - this seems to be the default in Yosemite
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
# Reset: defaults delete NSGlobalDomain NSDisableAutomaticTermination

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"
# Reset: defaults delete com.apple.CrashReporter DialogType

# Set Help Viewer windows to non-floating mode
# defaults write com.apple.helpviewer DevMode -bool true
# Reset: defaults delete com.apple.helpviewer DevMode

# Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Reset: sudo defaults delete /Library/Preferences/com.apple.loginwindow AdminHostInfo

# Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on

# Never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off > /dev/null
# Reset: sudo systemsetup -setcomputersleep 10 > /dev/null

# Check for software updates daily, not just once per week
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Reset: defaults delete com.apple.SoftwareUpdate ScheduleFrequency

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null
# Reset: launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && open /System/Library/CoreServices/NotificationCenter.app

# Disable smart quotes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Reset: defaults delete NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled

# Disable smart dashes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Reset: defaults delete NSGlobalDomain NSAutomaticDashSubstitutionEnabled

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 0
# Reset: sudo pmset -a hibernatemode 3

# Remove the sleep image file to save disk space
# sudo rm /Private/var/vm/sleepimage

# Create a zero-byte file instead…
# [I don't see the file being created again. Hence below is commented out]
# sudo touch /Private/var/vm/sleepimage
# …and make sure it can’t be rewritten
# sudo chflags uchg /Private/var/vm/sleepimage

# Disable the sudden motion sensor as it’s not useful for SSDs
# sudo pmset -a sms 0
# Reset: sudo pmset -a sms 1

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Reset:
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
# defaults -currentHost delete NSGlobalDomain com.apple.mouse.tapBehavior
# defaults delete NSGlobalDomain com.apple.mouse.tapBehavior

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
# Reset: One command is missing because that is the default in Yosemite in any case.
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
# defaults -currentHost delete NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior
# defaults -currentHost delete NSGlobalDomain com.apple.trackpad.enableSecondaryClick


# Disable “natural” (Lion-style) scrolling [I like this - hence commented]
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Reset: defaults delete NSGlobalDomain com.apple.swipescrolldirection

# Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Reset: defaults delete com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)"

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Reset: defaults delete NSGlobalDomain AppleKeyboardUIMode

# Use scroll gesture with the Ctrl (^) modifier key to zoom
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Reset: defaults delete com.apple.universalaccess closeViewScrollWheelToggle; defaults delete com.apple.universalaccess HIDScrollZoomModifierMask

# Follow the keyboard focus while zoomed in
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
# Reset: defaults delete com.apple.universalaccess closeViewZoomFollowsFocus

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Reset: defaults delete NSGlobalDomain ApplePressAndHoldEnabled

# Set a blazingly fast keyboard repeat rate; 0 is the fastest
defaults write NSGlobalDomain KeyRepeat -int 1
# Reset: defaults delete NSGlobalDomain KeyRepeat

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
# defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
# defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# Reset: defaults delete NSGlobalDomain AppleMeasurementUnits
defaults write NSGlobalDomain AppleMetricUnits -bool true
# Reset: defaults delete NSGlobalDomain AppleMetricUnits

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

# Set the time from network/location
# sudo systemsetup -setusingnetworktime on > /dev/null  # Already seems to be default
# Reset: sudo systemsetup -setusingnetworktime off > /dev/null

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Reset: defaults delete NSGlobalDomain NSAutomaticSpellingCorrectionEnabled

# Stop iTunes from responding to the keyboard media keys
#launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1 # This is default in any case
defaults write com.apple.screensaver askForPasswordDelay -int 5
# Reset: defaults write com.apple.screensaver askForPasswordDelay -int 300

# Save screenshots to the desktop or any dir of your choice
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
# Reset: defaults delete com.apple.screencapture location

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF). PNG is default
defaults write com.apple.screencapture type -string "png"
# Reset: defaults delete com.apple.screencapture type

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Reset: defaults delete com.apple.screencapture disable-shadow

# Enable subpixel font rendering on non-Apple LCDs
# https://www.howtogeek.com/358596/how-to-fix-blurry-fonts-on-macos-mojave-with-subpixel-antialiasing/
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
# Reset: defaults delete CGFontRenderingFontSmoothingDisabled
# Legacy Method:
# defaults write NSGlobalDomain AppleFontSmoothing -int 2
# Reset: defaults delete NSGlobalDomain AppleFontSmoothing

# Enable HiDPI display modes (requires restart) (https://www.tekrevue.com/tip/hidpi-mode-os-x/)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
# Reset: sudo defaults delete /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true
# Reset: defaults delete com.apple.finder QuitMenuItem

# Finder: disable window animations and Get Info animations
# defaults write com.apple.finder DisableAllAnimations -bool true
# Reset: defaults delete com.apple.finder DisableAllAnimations

# Set Desktop as the default location for new Finder windows
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# Reset: defaults delete com.apple.finder NewWindowTarget
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Reset: defaults delete com.apple.finder NewWindowTargetPath

# Show icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true  # Default on Sierra; `false` to hide

# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# Reset: defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# Reset: defaults delete com.apple.finder ShowMountedServersOnDesktop

# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true  # Default on Sierra; `false` to hide

# Finder: show hidden files by default
# Beware that this will make .DS_Store show up everywhere including the desktop and can be irritating
# defaults write com.apple.finder AppleShowAllFiles -bool true
# Reset: defaults delete com.apple.finder AppleShowAllFiles

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Reset: defaults delete NSGlobalDomain AppleShowAllExtensions

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true
# Reset: defaults delete com.apple.finder QLEnableTextSelection

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Reset: defaults delete com.apple.finder _FXShowPosixPathInTitle

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Reset: defaults delete com.apple.finder FXDefaultSearchScope

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Reset: defaults delete com.apple.finder FXEnableExtensionChangeWarning

# Enable spring loading for directories (open up directories when you drag files onto them)
# This is enabled by default. `false` to turn off.
# defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Reduce the spring loading delay for directories. `0` for no delay.
defaults write NSGlobalDomain com.apple.springing.delay -float 0.2
# Reset: defaults delete NSGlobalDomain com.apple.springing.delay -float 0.5

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Reset: defaults delete com.apple.desktopservices DSDontWriteNetworkStores

# Disable disk image verification
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# Reset:
# defaults delete com.apple.frameworks.diskimages skip-verify
# defaults delete com.apple.frameworks.diskimages skip-verify-locked
# defaults delete com.apple.frameworks.diskimages skip-verify-remote

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Reset:
# defaults delete com.apple.frameworks.diskimages auto-open-ro-root
# defaults delete com.apple.frameworks.diskimages auto-open-rw-root
# defaults delete com.apple.finder OpenWindowForNewRemovableDisk

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# Reset:
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist
# Reset: /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Reset:
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# Reset:
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 54" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 54" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 54" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# Reset:
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist


# Use list view in all Finder windows by default
# Four-letter codes for the other view modes:
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
# defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
# defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Reset: defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely by default
# defaults write com.apple.finder EmptyTrashSecurely -bool true
# Reset: defaults delete com.apple.finder EmptyTrashSecurely

# Enable AirDrop over Ethernet and on unsupported Macs running Lion (doesnt seem to work on Mojave)
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
# Reset: defaults delete com.apple.NetworkBrowser BrowseAllInterfaces

# Enable the MacBook Air SuperDrive on any Mac; doesnt work from Sierra unless you are
# booted into recovery partition; No idea what it does either.
# sudo nvram boot-args="mbasd=1"
# Reset: sudo nvram -d boot-args

# Show the ~/Library folder
chflags nohidden ~/Library
# Reset: chflags hidden ~/Library

# Remove Dropbox’s green checkmark icons in Finder
# file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
# [ -e "${file}" ] && mv -f "${file}" "${file}.bak"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
# Reset: defaults delete com.apple.finder FXInfoPanesExpanded

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
# defaults write com.apple.dock mouse-over-hilite-stack -bool true
# Reset: defaults delete com.apple.dock mouse-over-hilite-stack

# Set the icon size of Dock items to 40 pixels
defaults write com.apple.dock tilesize -int 40
# Reset: defaults delete com.apple.dock tilesize

# Change minimize/maximize window effect
# defaults write com.apple.dock mineffect -string "scale"
# Reset: defaults delete com.apple.dock mineffect

# Minimize windows into their application’s icon
# defaults write com.apple.dock minimize-to-application -bool true
# Reset: defaults delete com.apple.dock minimize-to-application

# Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
# Reset: defaults delete com.apple.dock enable-spring-load-actions-on-all-items

# Show indicator lights for open applications in the Dock
# This is already the default behaviour in Yosemite
# defaults write com.apple.dock show-process-indicators -bool true
# Reset: defaults delete com.apple.dock show-process-indicators

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array ""

# Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false
# Reset: defaults delete com.apple.dock launchanim

# Speed up Mission Control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1
# Reset: defaults delete com.apple.dock expose-animation-duration

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
# defaults write com.apple.dock expose-group-by-app -bool false
# Reset: defaults delete com.apple.dock expose-group-by-app

# Disable Dashboard
# Yosemite doesn't have the dashboard - so not relevant anymore
# defaults write com.apple.dashboard mcx-disabled -bool true
# Reset: defaults delete com.apple.dashboard mcx-disabled

# Don’t show Dashboard as a Space
# Yosemite doesn't have the dashboard - so not relevant anymore
# defaults write com.apple.dock dashboard-in-overlay -bool true
# Reset: defaults delete com.apple.dock dashboard-in-overlay

# Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false
# Reset: defaults delete com.apple.dock mru-spaces

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Reset: defaults delete com.apple.dock autohide

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0.2
# Reset: defaults delete com.apple.dock autohide-delay

# Reduce the animation delay when hiding/showing the Dock; To remove animation, set as 0
defaults write com.apple.dock autohide-time-modifier -float 0.5
# Reset: defaults delete com.apple.dock autohide-time-modifier

# Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true
# Reset: defaults delete com.apple.dock showhidden

# Disable the Launchpad gesture (pinch with thumb and three fingers)
# defaults write com.apple.dock showLaunchpadGestureEnabled -int 0
# Reset: defaults delete com.apple.dock showLaunchpadGestureEnabled

# Reset Launchpad, but keep the desktop wallpaper intact
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Add iOS Simulator to Launchpad; Not even sure if this exists anymore
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app" "/Applications/iOS Simulator.app"

# Add a spacer to the left side of the Dock (where the applications are)
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# Reset: defaults delete com.apple.dock wvous-tl-corner; defaults delete com.apple.dock wvous-tl-modifier

# Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# Reset: defaults delete com.apple.dock wvous-tr-corner; defaults delete com.apple.dock wvous-tr-modifier

# Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0
# Reset: defaults delete com.apple.dock wvous-bl-corner; defaults delete com.apple.dock wvous-bl-modifier

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Reset: defaults delete com.apple.Safari AutoOpenSafeDownloads

# Allow hitting the Backspace key to go to the previous page in history
# Use CMD + LeftArrow, which is already available.
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
# defaults write com.apple.Safari ShowFavoritesBar -bool false
# Reset: defaults delete com.apple.Safari ShowFavoritesBar

# Hide Safari’s sidebar in Top Sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false
# Reset: defaults delete com.apple.Safari ShowSidebarInTopSites

# Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
# Reset: defaults delete com.apple.Safari DebugSnapshotsUpdatePolicy

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Reset: defaults delete com.apple.Safari IncludeInternalDebugMenu

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# Reset: defaults delete com.apple.Safari FindOnPageMatchesWordStartsOnly

# Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"
# Reset: defaults delete com.apple.Safari ProxiesInBookmarksBar

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Reset:
# defaults delete com.apple.Safari IncludeDevelopMenu
# defaults delete com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey
# defaults delete com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# Reset: defaults delete NSGlobalDomain WebKitDeveloperExtras

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true
# Reset: defaults delete com.apple.mail DisableReplyAnimations; defaults delete com.apple.mail DisableSendAnimations


# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# Reset: defaults delete com.apple.mail AddressesIncludeNameOnPasteboard

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
# defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"
# Reset: defaults delete com.apple.mail NSUserKeyEquivalents

# Display emails in threaded mode, sorted by date (oldest at the top)
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"
# Reset: defaults delete com.apple.mail DraftsViewerAttributes

# Disable inline attachments (just show the icons)
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
# Reset: defaults delete com.apple.mail DisableInlineAttachmentViewing

# Disable automatic spell checking
# defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"
# Reset: defaults delete com.apple.mail SpellCheckingBehavior

###############################################################################
# Spotlight                                                                   #
###############################################################################

# Hide Spotlight menu-icon (and subsequent helper)
# Beware that this will completely disable spotlight on restart
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# Reset: sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing a specific volume.
# sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
# Reset: sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array

# Change indexing order and disable some file types
# defaults write com.apple.spotlight orderedItems -array \
# 	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
# 	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
# 	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
# 	'{"enabled" = 1;"name" = "PDF";}' \
# 	'{"enabled" = 1;"name" = "FONTS";}' \
# 	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
# 	'{"enabled" = 0;"name" = "MESSAGES";}' \
# 	'{"enabled" = 1;"name" = "CONTACT";}' \
# 	'{"enabled" = 1;"name" = "EVENT_TODO";}' \
# 	'{"enabled" = 1;"name" = "IMAGES";}' \
# 	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
# 	'{"enabled" = 0;"name" = "MUSIC";}' \
# 	'{"enabled" = 0;"name" = "MOVIES";}' \
# 	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
# 	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
# 	'{"enabled" = 0;"name" = "SOURCE";}'
# Reset: defaults delete com.apple.spotlight orderedItems

# Load new settings before rebuilding the index
# killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
# sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
# sudo mdutil -E / > /dev/null

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Solarized Dark theme by default in Terminal.app
# TERM_PROFILE='Solarized Dark xterm-256color';
# CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
# if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
# 	open "${HOME}/init/${TERM_PROFILE}.terminal";
# 	sleep 1; # Wait a bit to make sure the theme is loaded
# 	defaults write com.apple.terminal 'Default Window Settings' -string "${TERM_PROFILE}";
# 	defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";
# fi;

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
# defaults write com.apple.terminal FocusFollowsMouse -bool true
# defaults write org.x.X11 wm_ffm -bool true
# Reset:
# defaults delete com.apple.terminal FocusFollowsMouse; defaults delete org.x.X11 wm_ffm

# Install the Solarized Dark theme for iTerm
# open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
# Reset: defaults write com.googlecode.iterm2 PromptOnQuit -bool true

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Reset: defaults delete com.apple.TimeMachine DoNotOfferNewDisksForBackup

# Disable local Time Machine snapshots
# hash tmutil &> /dev/null && sudo tmutil disablelocal
sudo tmutil disablelocal
# Reset: sudo tmutil enablelocal

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Reset: defaults write com.apple.ActivityMonitor OpenMainWindow -bool false

# Visualize CPU usage in the Activity Monitor Dock icon
# defaults write com.apple.ActivityMonitor IconType -int 5
# Reset: defaults write com.apple.ActivityMonitor IconType -int 0

# Show all processes in Activity Monitor
# defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Reset: defaults write com.apple.ActivityMonitor ShowCategory -int 102

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
# Reset: defaults delete com.apple.ActivityMonitor SortColumn; defaults delete com.apple.ActivityMonitor SortDirection

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Address Book
# defaults write com.apple.addressbook ABShowDebugMenu -bool true
# Reset: defaults delete com.apple.addressbook ABShowDebugMenu

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
# defaults write com.apple.dashboard devmode -bool true
# Reset: defaults delete com.apple.dashboard devmode

# Enable the debug menu in iCal (pre-10.8)
# defaults write com.apple.iCal IncludeDebugMenu -bool true
# Reset: defaults delete com.apple.iCal IncludeDebugMenu

# Use plain text mode for new TextEdit documents
# defaults write com.apple.TextEdit RichText -int 0
# Reset: defaults delete com.apple.TextEdit RichText

# Open and save files as UTF-8 in TextEdit
# defaults write com.apple.TextEdit PlainTextEncoding -int 4
# defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# Reset: defaults delete com.apple.TextEdit PlainTextEncoding; defaults delete com.apple.TextEdit PlainTextEncodingForWrite

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true
# Reset: defaults delete com.apple.DiskUtility DUDebugMenuEnabled; defaults delete com.apple.DiskUtility advanced-image-options

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
# defaults write com.apple.appstore WebKitDeveloperExtras -bool true
# Reset: defaults delete com.apple.appstore WebKitDeveloperExtras

# Enable Debug Menu in the Mac App Store
# defaults write com.apple.appstore ShowDebugMenu -bool true
# Reset: defaults delete com.apple.appstore ShowDebugMenu

###############################################################################
# Messages                                                                    #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false
# Reset: defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool true

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
# Reset: defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool true

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false
# Reset: defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool true

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Allow installing user scripts via GitHub Gist or Userscripts.org
# defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
# defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
# Reset: defaults delete com.google.Chrome ExtensionInstallSources; defaults delete com.google.Chrome.canary ExtensionInstallSources

# Disable the all too sensitive backswipe
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
# Reset: defaults delete com.google.Chrome AppleEnableSwipeNavigateWithScrolls; defaults delete com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true
# Reset: defaults delete com.google.Chrome DisablePrintPreview; defaults delete com.google.Chrome.canary DisablePrintPreview

# ###############################################################################
# # Transmission.app                                                            #
# ###############################################################################

# # Use `~/Documents/Torrents` to store incomplete downloads
# defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
# defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# # Don’t prompt for confirmation before downloading
# defaults write org.m0k.transmission DownloadAsk -bool false

# # Trash original torrent files
# defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# # Hide the donate message
# defaults write org.m0k.transmission WarningDonate -bool false
# # Hide the legal disclaimer
# defaults write org.m0k.transmission WarningLegal -bool false

# ###############################################################################
# # Twitter.app                                                                 #
# ###############################################################################

# # Disable smart quotes as it’s annoying for code tweets
# defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# # Show the app window when clicking the menu bar icon
# defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# # Enable the hidden ‘Develop’ menu
# defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# # Open links in the background
# defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# # Allow closing the ‘new tweet’ window by pressing `Esc`
# defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# # Show full names rather than Twitter handles
# defaults write com.twitter.twitter-mac ShowFullNames -bool true

# # Hide the app in the background if it’s not the front-most window
# defaults write com.twitter.twitter-mac HideInBackground -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

# for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
# 	"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
# 	"Terminal" "Transmission" "Twitter" "iCal"; do
# 	killall "${app}" > /dev/null 2>&1
# done
echo "Done. Note that some of these changes require a logout/restart to take effect." 
