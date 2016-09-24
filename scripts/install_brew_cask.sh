#!/bin/sh

# Install Homebrew
if [ ! `which brew` ]; then
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Install Homebrew Cask packages..."

brew cask install dropbox
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install google-drive
brew cask install google-photos-backup
brew cask install firefox
brew cask install iterm2
brew cask install atom
brew cask install sourcetree
brew cask install sequel-pro
brew cask install skitch
brew cask install sketch
brew cask install skype
brew cask install slack
brew cask install vagrant
brew cask install virtualbox
brew cask install rubymine
brew cask install webstorm
brew cask install java
brew cask install android-studio
brew cask install genymotion
brew cask install 1password
brew cask install vlc

echo "Install Homebrew Cask packages...Done!"

echo "Cleanup cask"
brew cask cleanup
