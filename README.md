# Dotfiles

This repo contains my important dotfiles and other configuration.

Largely inspired by my colleague Burke, the dotfiles and other configuration in this repo is managed by `home-manager`, a nix-based declarative configuration manager specifically for configuring a user's environment. Burke's library of videos can be viewed [here](https://www.youtube.com/channel/UCSW5DqTyfOI9sUvnFoCjBlQ).

## Setup

Follow the regular home-manager installation: https://github.com/rycee/home-manager#installation

`git clone git@github.com:jonniesweb/dotfiles.git ~/src/github.com/jonniesweb/dotfiles`

### required Menlo Powerline font for iterm2, zsh agnoster theme

Fetch and install from https://github.com/abertsch/Menlo-for-Powerline

Then bootstrap home-manager via: `HOME_MANAGER_CONFIG=~/src/github.com/jonniesweb/dotfiles/home-manager/home.nix home-manager switch`

## Troubleshooting

### compinit insecure directories

https://stackoverflow.com/a/63447799
