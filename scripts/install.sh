#!/bin/bash -eu

BASEDIR=$(cd $(dirname $0)/.. && pwd)

echo "Start install & setup scripts."

for script in \
  "create_dotfiles.sh" \
  "install_brew.sh" \
  "install_mas.sh" \
  "install_asdf.sh" \
  "install_rust.sh" \
  "setup_fish.fish" \
  "setup_gpg.sh"; do

  cd $BASEDIR
  ${BASEDIR}/scripts/${script}
done

echo "All install & setup scripts done!"
