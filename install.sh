#!/bin/sh

if [ ! -e ${PWD}/scripts ]; then
  BRANCH=master
  ZIP_PATH=/tmp/macos-provisioning-${BRANCH}.zip
  DIR_PATH=/tmp/macos-provisioning-${BRANCH}
  EXEC_TMP_DIR=1
  curl -fsSL https://github.com/fujikky/macos-provisioning/archive/${BRANCH}.zip > $ZIP_PATH
  unzip $ZIP_PATH -d /tmp
  rm $ZIP_PATH
else
  DIR_PATH=${PWD}
  EXEC_TMP_DIR=0
fi

sh ${DIR_PATH}/scripts/create_dotfiles.sh
sh ${DIR_PATH}/scripts/install_brew.sh
sh ${DIR_PATH}/scripts/install_brew_cask.sh
sh ${DIR_PATH}/scripts/install_mas.sh
sh ${DIR_PATH}/scripts/setup_vim.sh
sh ${DIR_PATH}/scripts/setup_ruby.sh
sh ${DIR_PATH}/scripts/setup_node.sh
sh ${DIR_PATH}/scripts/install_xcode.sh

if [ EXEC_TMP_DIR ]; then
  rm -rf $DIR_PATH
fi
