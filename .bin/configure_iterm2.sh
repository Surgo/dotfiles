#!/usr/bin/env sh

set -eu

echo "## Configure iTerm2"
defaults write com.googlecode.iterm2 NoSyncTextReplacements -bool false
