#!/bin/bash -el

# Use pinentry-mac for the passphrase prompt. Without it, GPG Suite's own
# pinentry is used and signing from a terminal can fail with no dialog.
GPG_AGENT_CONF="${HOME}/.gnupg/gpg-agent.conf"
GPG_AGENT_CONF_UPDATED=false

# GPG Suite and gpg-agent write gpg-agent.conf on their own, so check for each
# setting instead of the file. A conf that exists without pinentry-program
# leaves gpg on the curses pinentry, which cannot open a dialog and fails with
# "Inappropriate ioctl for device".
add_gpg_agent_conf() {
  grep -qE "^$1([[:space:]]|$)" "$GPG_AGENT_CONF" && return 0

  echo "$1 $2" >> "$GPG_AGENT_CONF"
  GPG_AGENT_CONF_UPDATED=true
}

echo "Setup gpg-agent..."

mkdir -p "${HOME}/.gnupg"
chmod 700 "${HOME}/.gnupg"
touch "$GPG_AGENT_CONF"

add_gpg_agent_conf default-cache-ttl 600
add_gpg_agent_conf max-cache-ttl 7200
add_gpg_agent_conf pinentry-program "$(brew --prefix)/bin/pinentry-mac"

if [ "$GPG_AGENT_CONF_UPDATED" = true ]; then
  gpgconf --kill gpg-agent > /dev/null 2>&1 || true
fi

echo "Setup gpg-agent...Done!"

if git config --global gpg.program > /dev/null 2>&1 && \
  git config --global user.signingkey > /dev/null 2>&1 && \
  git config --global commit.gpgsign > /dev/null 2>&1; then
  echo "The GPG key is already set."
  exit 0
fi

echo "Setup GPG key..."

open "/Applications/GPG Keychain.app"

echo "Setup the new GPG key or import existing key."
echo -n "After setup the key from GPG Keychain App, press enter: "
read ENTER

GPG_KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep "^sec" | awk '{print $2}' | cut -d'/' -f2)

echo "Your GPG Key ID is $GPG_KEY_ID"

git config --global gpg.program gpg
git config --global user.signingkey $GPG_KEY_ID
git config --global commit.gpgsign true

echo "Setup GPG key...Done!"
