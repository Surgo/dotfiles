#!/usr/bin/env zsh

echo "## Build zsh completions"

rm -f "${ZDOTDIR:-$HOME}/.zcompdump"
compinit
