#!/bin/sh

ZIP_PATH="/tmp/macos-provisioning-master.zip"
TMP_DIR="/tmp/macos-provisioning-master"

echo "Start install & setup scripts."

if [ "$XCODE_INSTALL_PASSWORD" == "" ]; then
  echo "READ XCODE_INSTALL_PASSWORD : "
  read -s XCODE_INSTALL_PASSWORD
fi

echo "SHOW XCODE_INSTALL_PASSWORD : ${XCODE_INSTALL_PASSWORD}"

# cd $DIR_PATH && ${DIR_PATH}/scripts/create_dotfiles.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/install_brew.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/install_brew_cask.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/install_mas.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/setup_vim.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/setup_ruby.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/setup_node.sh
# cd $DIR_PATH && ${DIR_PATH}/scripts/install_xcode.sh

echo "All install & setup scripts done!"

rm -rf $TMP_DIR
echo "Deleted $TMP_DIR"

rm -rf $ZIP_PATH
echo "Deleted $ZIP_PATH"
