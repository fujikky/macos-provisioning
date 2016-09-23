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

SCRIPTS=(create_dotfiles.sh \
         install_brew.sh \
         install_brew_cask.sh \
         install_mas.sh \
         setup_vim.sh \
         setup_ruby.sh \
         setup_node.sh \
         install_xcode.sh)

for script in ${SCRIPTS[@]}; do
  cd $DIR_PATH
  sh ${DIR_PATH}/scripts/${script}
done

if [ EXEC_TMP_DIR ]; then
  rm -rf $DIR_PATH
fi
