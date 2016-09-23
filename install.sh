#!/bin/sh

BRANCH=master
ZIP_PATH=/tmp/macos-provisioning-${BRANCH}.zip
DIR_PATH=/tmp/macos-provisioning-${BRANCH}

curl -fsSL https://github.com/fujikky/macos-provisioning/archive/${BRANCH}.zip > $ZIP_PATH
unzip $ZIP_PATH -d /tmp
rm $ZIP_PATH

sh ${DIR_PATH}/scripts/create_dotfiles.sh
sh ${DIR_PATH}/scripts/install_brew.sh
sh ${DIR_PATH}/scripts/install_brew_cask.sh
sh ${DIR_PATH}/scripts/install_mas.sh
sh ${DIR_PATH}/scripts/setup_vim.sh
sh ${DIR_PATH}/scripts/setup_ruby.sh
sh ${DIR_PATH}/scripts/setup_node.sh
sh ${DIR_PATH}/scripts/install_xcode.sh

rm -rf $DIR_PATH
