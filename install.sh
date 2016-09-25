#!/bin/sh

ZIP_PATH="/tmp/macos-provisioning-master.zip"
TMP_DIR="/tmp/macos-provisioning-master"

echo "Start install & setup scripts."

for script in \
  "create_dotfiles.sh" \
  "install_brew.sh" \
  "install_brew_cask.sh" \
  "install_mas.sh" \
  "setup_vim.sh" \
  "setup_ruby.sh" \
  "setup_node.sh" \
  "install_xcode.sh" \
  "setpu_macos.sh"; do

  cd $TMP_DIR
  ${TMP_DIR}/scripts/${script}
done

echo "All install & setup scripts done!"

rm -rf $TMP_DIR
echo "Deleted $TMP_DIR"

rm -rf $ZIP_PATH
echo "Deleted $ZIP_PATH"
