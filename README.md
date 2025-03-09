# dotfiles

`brew install stow`

Use `~/dotfiles/` folder to store config files per application. Within each application folder, replicate the structure in home directory. Then, run `gnu stow app-name` to automatically create the symlink in ~.

## Todo

- [ ] Write setup.sh to automate stow per application folder
- [ ] Explore brew install packages automation