#!/bin/bash

BASEDIR=$(cd $(dirname $0)/.. && pwd)

echo "Start install & setup scripts."

for script in \
  "create_dotfiles.sh" \
  "install_brew.sh" \
  "install_mas.sh" \
  "install_go.sh" \
  "install_anyenv.sh" \
  "setup_fish.sh" \
  "install_xcode.sh"; do

  cd $BASEDIR
  ${BASEDIR}/scripts/${script}
done

echo "All install & setup scripts done!"
