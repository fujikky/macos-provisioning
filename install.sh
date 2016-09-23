#!/bin/sh

ZIP_PATH="/tmp/macos-provisioning-master.zip"
TMP_DIR="/tmp/macos-provisioning-master"

echo "Start install & setup scripts."

cd $TMP_DIR && ${TMP_DIR}/scripts/create_dotfiles.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/install_brew.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/install_brew_cask.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/install_mas.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/setup_vim.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/setup_ruby.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/setup_node.sh
cd $TMP_DIR && ${TMP_DIR}/scripts/install_xcode.sh

echo "All install & setup scripts done!"

rm -rf $TMP_DIR
echo "Deleted $TMP_DIR"

rm -rf $ZIP_PATH
echo "Deleted $ZIP_PATH"
