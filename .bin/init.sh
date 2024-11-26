#!/usr/bin/env sh

echo "# Initialize"
"$(dirname "$0")/install_brew.sh"
"$(dirname "$0")/configure_mac.sh"
"$(dirname "$0")/change_default_shell_to_zsh.sh"

"$(dirname "$0")/update.sh"
