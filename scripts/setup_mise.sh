#!/bin/bash -eu

echo "Setup mise..."

mise activate fish | source
mise use -g usage

echo "Install Ruby..."
mise install ruby@latest
mise use -g ruby@latest
echo "Install Ruby...Done!"

echo "Install Node..."
mise install node@lts
mise use -g node@lts
npm i -g yarn gitmoji-cli
echo "Install Node...Done!"

echo "Install pnpm..."
mise plugins install pnpm -y
mise install pnpm@latest
mise use -g pnpm@latest
echo "Install pnpm...Done!"

echo "Setup mise...Done!"
