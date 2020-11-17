#!/usr/bin/env bash

sudo -i bash << EOF
echo "/opt/brew/bin/zsh" >> /etc/shells
EOF
chsh -s /opt/brew/bin/zsh
