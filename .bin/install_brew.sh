#!/usr/bin/env bash
# See: <https://docs.brew.sh/Installation#alternative-installs>

sudo -i bash << EOF
mkdir -p /opt
chown -R "$LOGNAME":staff /opt
EOF

exit
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
brew update
brew bundle
