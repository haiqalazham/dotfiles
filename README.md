# dotfiles

`~/dotfiles/` folder stores config files per application. Within each application folder, replicate the structure in $HOME directory.

## Getting started

Clone the repo at $HOME directory.

`git clone git@github.com:haiqalazham/dotfiles.git && cd dotfiles`

## Installation

Run the following command

`source install.sh`

The install script will:

1. Install (or update) Homebrew
2. Install everything from Brewfile (formulae, casks and App Store apps via `mas`)
3. Setup Node and pnpm via fnm

## Git and SSH setup

Use 1Password SSH feature. Follow instructions in 1Password. Don't forget to setup `.gitconfig` and add commit author.

## Inspired by

- [Jason Morris' dotfiles repo](https://github.com/jsnmrs/dotfiles/)
- [Pablo Ordorica Wiener's dotfiles repo](https://github.com/pablordoricaw/my-mac-setup/)