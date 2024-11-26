#!/usr/bin/env sh

echo "## Change default shell to zsh"
sudo -i bash <<EOF
echo "/opt/homebrew/bin/zsh" >> /etc/shells
EOF
chsh -s /opt/homebrew/bin/zsh
