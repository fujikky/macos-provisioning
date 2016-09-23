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

echo "Start install & setup scripts."

cd $DIR_PATH && ${DIR_PATH}/scripts/create_dotfiles.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/install_brew.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/install_brew_cask.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/install_mas.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/setup_vim.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/setup_ruby.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/setup_node.sh
cd $DIR_PATH && ${DIR_PATH}/scripts/install_xcode.sh

echo "All install & setup scripts done!"

if [ $EXEC_TMP_DIR == 1 ]; then
  rm -rf $DIR_PATH
  echo "Deleted $DIR_PATH"
fi
