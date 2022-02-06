#!/usr/bin/env bash

sudo -i bash << EOF
echo "/usr/local/bin/zsh" >> /etc/shells
EOF
chsh -s /usr/local/bin/zsh
