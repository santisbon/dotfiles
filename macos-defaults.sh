#!/bin/sh

# Examples:
# 
# defaults help
# defaults domains | tr ', ' '\n' | grep 'Safari'
# defaults find ${word}
# defaults read-type ${domain} ${key}
# defaults read com.apple.dock | grep wvous

# You can figure out which settings exist with a 
# `diff` in the output of `defaults read ${domain} > my-defaults.txt` 
# before and afer manually changing them in the UI.

# Safari is sandboxed preventing `defaults` from read/writing to it. 
# Your terminal needs full disk access so `defaults` can access the sandboxed container.

cd ~

###################################################################################################################
# SAFARI
###################################################################################################################
echo "Setting Safari preferences..."

defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari ShowOverlayStatusBar -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true

killall Safari 2> /dev/null

###################################################################################################################
# FINDER
###################################################################################################################
echo "Setting Finder preferences..."

# Writing of .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder AppleShowAllFiles -bool false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Arrange by Kind, Name, Application, Date Last Opened, Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "Name"
# Icon View   : `icnv` 
# List View   : `Nlsv` 
# Column View : `clmv` 
# Cover Flow  : `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true 
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true 
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string "PfVo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///"
defaults write com.apple.finder PreferencesWindow.LastSelection -string "GNRL"
defaults write com.apple.finder ShowPathbar -bool true 
defaults write com.apple.finder ShowStatusBar -bool true

find . -name '.DS_Store' -type f -delete 2> /dev/null
killall Finder 2> /dev/null

###################################################################################################################
# DOCK
###################################################################################################################
echo "Setting Dock preferences..."

# tl (top left), tr (top right), bl (top left), br (bottom right)

# 1: -
# 2: Mission Control
# 3: Application windows
# 4: Desktop
# 5: Start screen saver
# 6: Disable screen saver
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# 14: Quick Note
defaults write com.apple.dock wvous-br-corner -int 13

killall Dock 2> /dev/null

###################################################################################################################
# 
###################################################################################################################

echo "Done."