#!/usr/bin/env sh

set -eu

echo "## Build zsh completions"

rm -f "${ZDOTDIR:-$HOME}/.zcompdump"

zsh -fc '
autoload -Uz compinit
compinit
'
