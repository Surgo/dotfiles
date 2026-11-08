#!/usr/bin/env sh

set -eu

echo "## Build Neovim native plugins"

NVIM_PACK_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/nvim/pack/plugins/start"

make -C "${NVIM_PACK_DIR}/telescope-fzf-native"
