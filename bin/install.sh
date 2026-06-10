#!/bin/sh

# clone dotfiles repo
git clone https://github.com/cwjiee/dotfiles .

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install brew packages
brew update
brew upgrade
xargs brew install < Brewfile
brew cleanup
