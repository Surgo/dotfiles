#!/usr/bin/env sh

set -eu

echo "## Change default shell to zsh"

ZSH_PATH="$(command -v zsh)"

if ! grep -qxF "$ZSH_PATH" /etc/shells; then
  echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
fi

if [ "$SHELL" != "$ZSH_PATH" ]; then
  chsh -s "$ZSH_PATH"
fi
