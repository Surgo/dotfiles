#!/usr/bin/env sh

set -eu

echo "## Rebuild zsh completions"

rm -f "${ZDOTDIR:-$HOME}"/.zcompdump*

zsh -i -c exit
