#!/usr/bin/env bash

sudo -i bash <<EOF
echo "/opt/homebrew/bin/zsh" >> /etc/shells
EOF
chsh -s /opt/homebrew/bin/zsh
