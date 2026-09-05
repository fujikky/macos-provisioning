#!/bin/bash -el

# Use pinentry-mac for the passphrase prompt. Without it, GPG Suite's own
# pinentry is used and signing from a terminal can fail with no dialog.
GPG_AGENT_CONF="${HOME}/.gnupg/gpg-agent.conf"
if [ ! -f "$GPG_AGENT_CONF" ]; then
  echo "Setup gpg-agent..."
  mkdir -p "${HOME}/.gnupg"
  chmod 700 "${HOME}/.gnupg"
  cat > "$GPG_AGENT_CONF" <<EOF
default-cache-ttl 600
max-cache-ttl 7200
pinentry-program $(brew --prefix)/bin/pinentry-mac
EOF
  gpgconf --kill gpg-agent > /dev/null 2>&1 || true
  echo "Setup gpg-agent...Done!"
fi

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
