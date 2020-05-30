# Demo file that shows how to script `defaults write`
# to set many system preferences and application settings.
#
# These are gathered from many different sources.
#
# Thanks:
#   * https://github.com/stianeikeland/dotfiles/edit/master/bin/sanemacdefaults.sh
#   * https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/
#   * http://dreynaud.fail/new-mac-setup/


## NSGlobalDomain

# Save to disk (not to iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Enable subpixel font rendering on non-Apple LCDs.
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Always show scrollbars.
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disable press-and-hold for keys in favor of key repeat. (disabled... I still like press-and-hold for foreign characters)
#defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 0


## Finder

# Enable quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show all files
defaults write com.apple.finder AppleShowAllFiles YES

# Empty Trash securely by default (removed: too slow..)
#defaults write com.apple.finder EmptyTrashSecurely -bool true

# Disable the warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Allow selection of text in quicklook windows.
defaults write com.apple.finder QLEnableTextSelection -bool true


## Dock

# Make Dock icons of hidden applications translucent.
defaults write com.apple.dock showhidden -bool true

# Show indicator lights for open applications in the Dock.
defaults write com.apple.dock show-process-indicators -bool true

# Remove the auto-hiding Dock delay.
defaults write com.apple.Dock autohide-delay -float 0

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true

# Disable expose animation.
defaults write com.apple.dock expose-animation-duration -float 0


## Screen Saver

# Require password 5s after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5


## Safari

# Enable Safari’s debug menu.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true


## Network Browser

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1


## Desktop Services

# Avoid creating .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


## Bluetooth

# Set Bluetooth headset higher bitrate.
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


## Press And Hold

# Disable press-and-hold for keys in favor of key repeat.
#defaults write -g ApplePressAndHoldEnabled -bool false


## Quick Look

# Settings for qlcolorcode quicklook plugin.
# https://github.com/n8gray/QLColorCode
# https://github.com/sindresorhus/quick-look-plugins
defaults write org.n8gray.QLColorCode hlTheme pablo
defaults write org.n8gray.QLColorCode font Monaco


## Flags

# Show the ~/Library folder.
chflags nohidden ~/Library


## Finally

# Kill affected applications.
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
