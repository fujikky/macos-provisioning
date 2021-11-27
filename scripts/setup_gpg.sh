#!/bin/bash -eu

BASEDIR=$(cd $(dirname $0)/.. && pwd)

echo "Setup GPG key..."

open "/Applications/GPG Keychain.app"

echo "Setup the new GPG key or import existing key."
echo -n "After setup the key from GPG Keychain App, press enter:"
read ENTER

GPG_KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep "^sec" | awk '{print $2}' | sed -r 's/^rsa4096\/(.+)$/\1/')

echo "Your GPG Key ID is $GPG_KEY_ID"

git config --global gpg.program gpg
git config --global user.signingkey $GPG_KEY_ID
git config --global commit.gpgsign true

echo "Setup GPG key...Done!"
