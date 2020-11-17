#!/usr/bin/env bash
# See: <https://docs.brew.sh/Installation#alternative-installs>

sudo -i bash << EOF
mkdir -p /opt
chown -R "$LOGNAME":staff /opt
EOF

mkdir -p /opt/brew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /opt/brew

export PATH="/opt/brew/bin:$PATH"
brew update
brew bundle
