#!/bin/sh

BASEDIR=$(cd $(dirname $0)/.. && pwd)

echo "Start install & setup scripts."

for script in \
  "create_dotfiles.sh" \
  "install_brew.sh" \
  "install_mas.sh" \
  "setup_fish.sh" \
  "install_anyenv.sh" \
  "install_xcode.sh" \
  "setup_macos.sh"; do

  cd $BASEDIR
  ${BASEDIR}/scripts/${script}
done

echo "All install & setup scripts done!"
