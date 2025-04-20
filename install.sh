#!/usr/bin/env bash

echo -e "\\n⬇️ Set up Homebrew"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo -e "\\n⬇️ Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "\\n⭐️ Installed Homebrew! Close all terminal sessions and run this script again."
  exit
fi

echo -e "\\n🔁 Homebrew is installed! Updating instead."

brew update && brew upgrade

# Install everything
echo -e "\\n⬇️ Installing everything from Brewfile"
brew bundle

echo -e "\\n✅ Installation complete!"

# Setup dotfiles

echo -e "\\n⚙️ Set up dotfiles"
stow zsh

echo -e "\\n✅ Installation complete!"

# Set up Node
echo -e "\\n⬇️ Setup fnm, Node, and global NPM packages"

# Initialize fnm to run now
eval "$(fnm env --use-on-cd --shell zsh)"

# Get latest LTS Node version
fnm install --lts

# Install global Node modules
if ! command -v npm &> /dev/null; then
  then
  echo -e "\\n❌ NPM not installed"
else
  echo -e "\\n⬇️ Install global Node modules"
  npm install pnpm@latest-10 --location=global
fi

echo -e "\\n🎉 All setup tasks complete! Note that some of these changes require a logout/restart to take effect."