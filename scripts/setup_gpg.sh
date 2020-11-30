#!/bin/bash

BASEDIR=$(cd $(dirname $0)/.. && pwd)

echo "Setup GPG key..."

open "/Applications/GPG Keychain.app"

echo "Setup the new GPG key or import existing key."
echo -n "After setup the key from GPG Keychain App, press enter:"
read ENTER

gpg --list-secret-keys --keyid-format LONG

echo -n "Enter your GPG Key ID (ex: 'sec   rsa4096/<your-gpg-key-id> yyyy-MM-dd [SC] [expires: yyyy-MM-dd]':"
read GPG_KEY_ID

git config --global gpg.program gpg
git config --global user.signingkey $GPG_KEY_ID
git config --global commit.gpgsign true

echo "Setup GPG key...Done!"
