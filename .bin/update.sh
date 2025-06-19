#!/usr/bin/env sh

echo "# Update"
"$(dirname "$0")/update_mac.sh"
"$(dirname "$0")/update_gitignore_global.sh"
"$(dirname "$0")/build_zcomp.sh"
"$(dirname "$0")/build_bat.sh"
