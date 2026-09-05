#!/bin/bash -eu

echo "Setup macOS preferences..."

# Keyboard: caps lock acts as control
# 30064771129 = 0x700000039 (caps lock), 30064771300 = 0x7000000E4 (right control)
CAPS_LOCK_TO_CONTROL='(
  {
    HIDKeyboardModifierMappingDst = 30064771300;
    HIDKeyboardModifierMappingSrc = 30064771129;
  }
)'

defaults -currentHost write NSGlobalDomain \
  com.apple.keyboard.modifiermapping.alt_handler_id-82 "$CAPS_LOCK_TO_CONTROL"

# The per-device key carries the vendor and product id of the keyboard,
# which differ between machines.
KEYBOARD_ID=$(ioreg -c AppleDeviceManagementHIDEventService -r -d 1 | awk '
  /"VendorID" =/ { vendor = $3 }
  /"Product" = "Apple Internal Keyboard/ { found = 1 }
  found && /"ProductID" =/ { print vendor "-" $3 "-0"; exit }
')

if [ -n "$KEYBOARD_ID" ]; then
  defaults -currentHost write NSGlobalDomain \
    "com.apple.keyboard.modifiermapping.${KEYBOARD_ID}" "$CAPS_LOCK_TO_CONTROL"
else
  echo "    Built-in keyboard not found."
  echo "    Set it in System Settings > Keyboard > Keyboard Shortcuts > Modifier Keys."
fi

# Trackpad: look up & data detectors with a three finger tap
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 2

# Dock: hide automatically
defaults write com.apple.dock autohide -bool true
killall Dock || true

echo "Setup macOS preferences...Done!"
echo "    Log out and back in to apply the keyboard mapping."
