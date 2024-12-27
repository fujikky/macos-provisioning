#!/bin/bash -eu

BASEDIR=$(cd $(dirname $0)/.. && pwd)

if [ $(uname -m) = "arm64" ]; then
  BREW_PATH=/opt/homebrew/bin/brew
else
  BREW_PATH=/usr/local/bin/brew
fi

# Install Homebrew
if [ ! -x $BREW_PATH ]; then
  echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
eval "$($BREW_PATH shellenv)"

echo "Start packages installation and setup scripts."

for script in \
  "create_dotfiles.sh" \
  "install_brew.sh" \
  "install_mas.sh" \
  "setup_fish.fish" \
  "setup_java.sh" \
  "setup_mise.sh" \
  "setup_gh.sh" \
  "setup_gpg.sh"; do

  cd $BASEDIR
  ${BASEDIR}/scripts/${script}
done

echo "All packages installation and setup scripts are complete!"
