#!/bin/sh -x

# Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

# Trackpad: enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Capls Lock key to Ctrl key
keyboardids="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)"
for keyboardid in $keyboardids
do
	keyboardid="${keyboardid}-0"
	defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboardid} \
	    -array-add \
	    '<dict>
				<key>HIDKeyboardModifierMappingSrc</key>
				<integer>30064771129</integer>
	      <key>HIDKeyboardModifierMappingDst</key>
	      <integer>30064771296</integer>
	    </dict>'
done

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" "Finder"; do
	killall "${app}" &> /dev/null
done
