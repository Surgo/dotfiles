#!/usr/bin/env zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/bundle
brew bundle --global
brew autoupdate start 86400 --upgrade --cleanup --immediate --sudo
